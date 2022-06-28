import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/data/parameters/login_dto.dart';
import 'package:growell/domain/usecases/login_use_case.dart';
import 'package:growell/presentation/login/bloc/login_event.dart';
import 'package:growell/presentation/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginUseCase loginUseCase;

  LoginBloc(
    this.loginUseCase
  ) : super(PageLoading()) {
    on<MasukEvent>(_login);
  }

  @override
  // ignore: avoid_renaming_method_parameters
  void onError(Object error, StackTrace stacktrace) {
    add(ThrowErrorLoginEvent(error));
    super.onError(error, stacktrace);
  }

  void _login(MasukEvent event, Emitter<LoginState> emit) async {
    emit(LoadinLoginState());
    var response = await loginUseCase.login(params: event.params!);
    emit(
      response.fold(
        (l) => SuccessLoginState(
          data: l
        ), 
        (r) => ErrorLoginState(
          message: r.errorData.errorMessage
        )
      )
    );
  }
}