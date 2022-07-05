import 'package:growell/data/models/add_produk_model.dart';

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