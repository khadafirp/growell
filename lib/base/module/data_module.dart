import 'package:growell/base/module/base_modul.dart';
import 'package:growell/data/datasource/user_datasource.dart';
import 'package:growell/data/repositories/user_repository.dart';
import 'package:growell/utils/preference.dart';

void dataModule() {
  //DATASOURCE
  injector.registerLazySingleton<UserDatasources>(() => UserDatasourcesImpl());

  //REPOSITORY
  injector.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(injector()));

}
