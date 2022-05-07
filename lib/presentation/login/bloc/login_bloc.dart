import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/presentation/login/bloc/login_event.dart';
import 'package:growell/presentation/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc(
  ) : super(PageLoading());
}