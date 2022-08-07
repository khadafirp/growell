import 'package:flutter/material.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';
import 'package:growell/data/models/login_model.dart';
import 'package:growell/data/parameters/filter_edit_produk_dto.dart';
import 'package:growell/data/parameters/filter_list_toko_dto.dart';
import 'package:growell/data/parameters/get_list_keranjang_produk_dto.dart';
import 'package:growell/presentation/first_page.dart';
import 'package:growell/presentation/landing_page/landing_page.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/detail_produk_pembeli.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/list_produk_toko.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/list_toko_page.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/keranjang_produk_penjual_page.dart';
import 'package:growell/presentation/landing_page/penjual/produk/add_produk_page.dart';
import 'package:growell/presentation/landing_page/penjual/produk/detail_produk_penjual.dart';
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
    RoutesName.landingPage: (context) => LandingPage(),
    RoutesName.listTokoPage: (context) => ListTokoPage(
      params: settings.arguments as FilterListTokoDTO,
    ),
    RoutesName.addProdukPage: (context) => AddProdukPage(
      params: settings.arguments as FilterEditProdukDTO,
    ),
    RoutesName.listProdukPage: (context) => ListProdukPage(),
    RoutesName.listProdukTokoPage: (context) => ListProdukToko(
      id_user: settings.arguments as String,
    ),
    RoutesName.detailProdukPembeli: (context) => DetailProdukPembeli(
      entity: settings.arguments as ProdukPenjualEntity,
    ),
    RoutesName.keranjangPenjual: (context) => KeranjangProdukPenjualPage(
      params: settings.arguments as GetListKeranjangProdukDTO,
    ),
    RoutesName.detailProdukPenjual: (context) => DetailProdukPenjual(
      entity: settings.arguments as ProdukPenjualEntity,
    ),
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
      case RoutesName.listProdukTokoPage:
        final routes = getRoutesWithSettings(settings);
        final WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(builder: builder!, settings: settings);
      case RoutesName.detailProdukPembeli:
        final routes = getRoutesWithSettings(settings);
        final WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(builder: builder!, settings: settings);
      case RoutesName.keranjangPenjual:
        final routes = getRoutesWithSettings(settings);
        final WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(builder: builder!, settings: settings);
      case RoutesName.detailProdukPenjual:
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