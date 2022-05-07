import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/base/module/base_modul.dart';
import 'package:growell/presentation/login/bloc/login_bloc.dart';

class AppBloc{
  static List<BlocProvider> getBlocProviders() => [
    BlocProvider<LoginBloc>(
      create: (context) => injector.get<LoginBloc>(),
    )
  ];
}