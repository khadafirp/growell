import 'package:growell/base/module/base_modul.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_bloc.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_bloc.dart';
import 'package:growell/presentation/login/bloc/login_bloc.dart';
import 'package:growell/presentation/regis/bloc/regis_bloc.dart';
import 'package:growell/utils/preference.dart';

void presentationModule() {
  injector.registerLazySingleton(() => RegisBloc(injector()));
  injector.registerLazySingleton(() => LoginBloc(injector()));
  injector.registerLazySingleton(() => AddProdukBloc(injector(), injector(), injector()));
  injector.registerLazySingleton(() => BerandaPenjualBloc(injector()));
}
