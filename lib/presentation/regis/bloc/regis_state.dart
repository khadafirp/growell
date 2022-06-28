import 'package:equatable/equatable.dart';

class RegisState extends Equatable {

  RegisState();

  @override
  List<Object> get props => [];
}

class InitialRegisState extends RegisState{}

class LoadingRegisState extends RegisState {}

class SuccessRegisState extends RegisState{
  dynamic data;
  SuccessRegisState({this.data});
}

class ErrorRegisState extends RegisState {
  String message;
  ErrorRegisState({this.message = ""});
}