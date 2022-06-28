import 'package:equatable/equatable.dart';
import 'package:growell/data/parameters/login_dto.dart';

class LoginEvent extends Equatable{
  LoginEvent();

  @override
  List<Object> get props => [];
}

class MasukEvent extends LoginEvent {
  LoginDTO? params;
  MasukEvent({this.params});
}

class ThrowErrorLoginEvent extends LoginEvent{
  Object? error;
  ThrowErrorLoginEvent(this.error);
}