import 'package:growell/base/module/base_modul.dart';
import 'package:growell/domain/usecases/add_produk_use_case.dart';
import 'package:growell/domain/usecases/add_user_use_case.dart';
import 'package:growell/domain/usecases/login_use_case.dart';
import 'package:growell/utils/preference.dart';

void domainModule() {
  injector.registerLazySingleton(() => AddUserUseCase(injector()));
  injector.registerLazySingleton(() => LoginUseCase(injector()));
  injector.registerLazySingleton(() => AddProdukUseCase(injector()));
}
