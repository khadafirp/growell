

import 'package:growell/base/module/base_modul.dart';
import 'package:growell/base/network/network_client.dart';

void networkModule() {
  injector.registerLazySingleton(() => NetworkClient());
}
