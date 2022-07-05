import 'package:growell/base/module/base_modul.dart';
import 'package:growell/data/datasource/produk_datasource.dart';
import 'package:growell/data/datasource/user_datasource.dart';
import 'package:growell/data/repositories/produk_repository.dart';
import 'package:growell/data/repositories/user_repository.dart';
import 'package:growell/utils/preference.dart';

void dataModule() {
  //DATASOURCE
  injector.registerLazySingleton<UserDatasources>(() => UserDatasourcesImpl());
  injector.registerLazySingleton<ProdukDatasources>(() => ProdukDatasourcesImpl());

  //REPOSITORY
  injector.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(injector()));
  injector.registerLazySingleton<ProdukRepository>(() => ProdukRepositoryImpl(injector()));
}
