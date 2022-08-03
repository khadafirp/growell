import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/models/add_keranjang_toko_model.dart';
import 'package:growell/data/models/list_user_model.dart';

class ListTokoState {
  ListTokoState();

  @override
  List<Object> get props => [];
}

class InitialListTokoState extends ListTokoState{}

class LoadingGetListTokoState extends ListTokoState{}

class SuccessGetListTokoState extends ListTokoState{
  List<UserEntity>? entity;
  SuccessGetListTokoState({this.entity});
}

class ErrorListTokoState extends ListTokoState{
  String? message;
  ErrorListTokoState({this.message});
}

class LoadingAddKeranjangTokoState extends ListTokoState{}

class SuccessAddKeranjangTokoState extends ListTokoState{
  AddKeranjangTokoEntity? entity;
  SuccessAddKeranjangTokoState({this.entity});
}

class ErrorAddKeranjangTokoTokoState extends ListTokoState{
  String? message;
  ErrorAddKeranjangTokoTokoState({this.message});
}