import 'package:flutter/material.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/data/models/login_model.dart';
import 'package:growell/presentation/first_page.dart';
import 'package:growell/presentation/landing_page/landing_page.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/list_toko_page.dart';
import 'package:growell/presentation/landing_page/penjual/produk/add_produk_page.dart';
import 'package:growell/presentation/landing_page/penjual/produk/list_produk_page.dart';
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
    RoutesName.landingPage: (context) => LandingPage(entity: settings.arguments as LoginEntity,),
    RoutesName.listTokoPage: (context) => ListTokoPage(),
    RoutesName.addProdukPage: (context) => AddProdukPage(),
    RoutesName.listProdukPage: (context) => LIstProdukPage()
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
      case RoutesName.listTokoPage:
        final routes = getRoutesWithSettings(settings);
        final WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(builder: builder!, settings: settings);
      case RoutesName.addProdukPage:
        final routes = getRoutesWithSettings(settings);
        final WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(builder: builder!, settings: settings);
      case RoutesName.listProdukPage:
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