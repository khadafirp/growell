import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/base/app_routes.dart';
import 'package:growell/base/module/base_bloc_module.dart';
import 'package:growell/base/module/base_modul.dart';
import 'package:growell/base/routes_name.dart';

void main() {
  initModule();
  runApp(MyApp(initialRoute: RoutesName.loginPage,));
}

class MyApp extends StatelessWidget {
  String? initialRoute;
  MyApp({Key? key, this.initialRoute}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.getBlocProviders(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: "Growell",
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: "Montserrat-Black",
              ),
        ),
        debugShowCheckedModeBanner: false,
        builder: (context, widget) => widget!,
        initialRoute: initialRoute,
        routes: AppRoutes.getRoutes(),
        onGenerateRoute: AppRoutes.getGenerateRoutes,
      ),
    );
  }
}
