import 'package:equatable/equatable.dart';

class LoginState extends Equatable{
  @override
  List<Object> get props => [];
}

class PageLoading extends LoginState{}

class LoadinLoginState extends LoginState{}

class SuccessLoginState extends LoginState {
  dynamic data;
  SuccessLoginState({this.data});
}

class ErrorLoginState extends LoginState {
  String message;
  ErrorLoginState({this.message = ""});
}