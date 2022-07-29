import 'package:growell/data/models/list_keranjang_produk_penjual_model.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_event.dart';

class BerandaPenjualState {
  BerandaPenjualState();

  @override
  List<Object> get props => [];
}

class InitialBerandaPenjualState extends BerandaPenjualState {}

class LoadingGetListProdukBerandaPenjualState extends BerandaPenjualState {}

class SuccessGetListProdukBerandaPenjualState extends BerandaPenjualState {
  ListProdukPenjualEntity? entity;
  SuccessGetListProdukBerandaPenjualState({this.entity});
}

class ErrorGetListProdukBerandaPenjualState extends BerandaPenjualState {
  String message;
  ErrorGetListProdukBerandaPenjualState({this.message = ""});
}