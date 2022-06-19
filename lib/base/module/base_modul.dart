import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:growell/base/module/network_module.dart';
import 'package:growell/base/module/preference_module.dart';

GetIt injector = GetIt.instance;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void initModule() {
  networkModule();
  preferenceModule();
}
