import 'package:growell/data/models/add_produk_model.dart';
import 'package:growell/data/models/edit_produk_model.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';

class AddProdukState {
  AddProdukState();

  @override
  List<Object> get props => [];
}

class InitialAddProdukState extends AddProdukState {}

class LoadingAddProdukState extends AddProdukState {}

class SuccessAddProdukState extends AddProdukState {
  AddProdukEntity? entity;
  SuccessAddProdukState({this.entity});
}

class ErrorAddProdukState extends AddProdukState {
  String message;
  ErrorAddProdukState({this.message = ""});
}

class LoadingGetListProdukPenjual extends AddProdukState{}

class SuccessGetListProdukPenjualState extends AddProdukState{
  List<ProdukPenjualEntity>? entity;
  SuccessGetListProdukPenjualState({this.entity});
}

class ErrorGetListProdukPenjualState extends AddProdukState{
  String message;

  ErrorGetListProdukPenjualState({this.message = ""});
}

class LoadingEditProdukState extends AddProdukState{}

class SuccessEditProdukState extends AddProdukState{
  EditProdukEntity? entity;
  SuccessEditProdukState({this.entity});
}

class ErrorEditProdukState extends AddProdukState{
  String message;

  ErrorEditProdukState({this.message = ""});
}