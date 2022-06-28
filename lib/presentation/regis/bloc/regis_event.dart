import 'package:equatable/equatable.dart';
import 'package:growell/data/parameters/add_user_dto.dart';

class RegisEvent extends Equatable {
  RegisEvent();

  @override
  List<Object> get props => [];
}

class ThrowErrorRegisEvent extends RegisEvent {
  ThrowErrorRegisEvent(this.error);

  final Object error;
}

class DaftarEvent extends RegisEvent {
  AddUserDTO? entity;
  DaftarEvent({this.entity});
}