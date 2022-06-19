import 'package:growell/base/module/base_modul.dart';
import 'package:growell/utils/preference.dart';

void preferenceModule() {
  injector.registerLazySingleton(() => Preference());
}
