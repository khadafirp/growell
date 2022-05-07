import 'package:flutter/material.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/presentation/first_page.dart';
import 'package:growell/presentation/landing_page/landing_page.dart';
import 'package:growell/presentation/login/login_page.dart';
import 'package:growell/presentation/regis/regis_page.dart';

class AppRoutes{
  static Map<String, WidgetBuilder> getRoutes() => {
    RoutesName.onBoard: (context) => FirtsPage()
  };

  static Map<String, WidgetBuilder> getRoutesWithSettings(
    RouteSettings settings) =>
  {
    RoutesName.onBoard: (context) {
      return FirtsPage();
    },
    RoutesName.loginPage: (context) => LoginPage(),
    RoutesName.regisPage: (context) => RegisPage(),
    RoutesName.landingPage: (context) => LandingPage()
  };

  static Route<dynamic> getGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onBoard:
        final routes = getRoutesWithSettings(settings);
        final WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(builder: builder!, settings: settings);
      case RoutesName.loginPage:
        final routes = getRoutesWithSettings(settings);
        final WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(builder: builder!, settings: settings);
      case RoutesName.regisPage:
        final routes = getRoutesWithSettings(settings);
        final WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(builder: builder!, settings: settings);
      case RoutesName.landingPage:
        final routes = getRoutesWithSettings(settings);
        final WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(builder: builder!, settings: settings);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}