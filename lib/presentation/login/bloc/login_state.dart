import 'package:equatable/equatable.dart';
import 'package:growell/data/models/login_model.dart';

class LoginState extends Equatable{
  @override
  List<Object> get props => [];
}

class PageLoading extends LoginState{}

class LoadinLoginState extends LoginState{}

class SuccessLoginState extends LoginState {
  LoginEntity? data;
  SuccessLoginState({this.data});
}

class ErrorLoginState extends LoginState {
  String message;
  ErrorLoginState({this.message = ""});
}