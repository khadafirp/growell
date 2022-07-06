import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/base/module/base_modul.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_bloc.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_bloc.dart';
import 'package:growell/presentation/login/bloc/login_bloc.dart';
import 'package:growell/presentation/regis/bloc/regis_bloc.dart';

class AppBloc{
  static List<BlocProvider> getBlocProviders() => [
    BlocProvider<LoginBloc>(
      create: (context) => injector.get<LoginBloc>(),
    ),
    BlocProvider<RegisBloc>(
      create: (context) => injector.get<RegisBloc>(),
    ),
    BlocProvider<AddProdukBloc>(
      create: (context) => injector.get<AddProdukBloc>(),
    ),
    BlocProvider<BerandaPenjualBloc>(
      create: (context) => injector.get<BerandaPenjualBloc>(),
    )
  ];
}