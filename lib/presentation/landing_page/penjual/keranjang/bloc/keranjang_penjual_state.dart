import 'package:growell/data/models/add_keranjang_produk_model.dart';

class KeranjangPenjualState {
  KeranjangPenjualState();

  @override
  List<Object> get props => [];
}

class InitialKeranjangPenjualState extends KeranjangPenjualState {}

class LoadingKeranjangPenjualState extends KeranjangPenjualState {}

class LoadedKeranjangPenjualState extends KeranjangPenjualState {
  AddKeranjangProdukEntity? entity;
  LoadedKeranjangPenjualState({this.entity});
}

class ErrorKeranjangPenjualState extends KeranjangPenjualState{
  String? message;
  ErrorKeranjangPenjualState({this.message});
}