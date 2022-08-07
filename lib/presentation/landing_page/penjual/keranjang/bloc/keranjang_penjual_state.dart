import 'package:growell/data/models/add_keranjang_produk_model.dart';
import 'package:growell/data/models/add_riwayat_transaksi_model.dart';
import 'package:growell/data/models/list_keranjang_produk_penjual_model.dart';

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

class LoadingGetListKeranjangProdukPenjualState extends KeranjangPenjualState {}

class SuccessGetListKeranjangProdukPenjualState extends KeranjangPenjualState {
  ListKeranjangProduk? entity;
  SuccessGetListKeranjangProdukPenjualState({this.entity});
}

class ErrorGetListKeranjangProdukPenjualState extends KeranjangPenjualState {
  String message;
  ErrorGetListKeranjangProdukPenjualState({this.message = ""});
}

class LoadingAddRiwayatTransaksiPenjualState extends KeranjangPenjualState {}

class SuccessAddRiwayatTransaksiPenjualState extends KeranjangPenjualState {
  AddRiwayatTransaksiEntity? entity;
  SuccessAddRiwayatTransaksiPenjualState({this.entity});
}

class ErrorAddRiwayatTransaksiPenjualState extends KeranjangPenjualState {
  String message;
  ErrorAddRiwayatTransaksiPenjualState({this.message = ""});
}

class LoadingAddRiwayatTransaksiDetailPenjualState extends KeranjangPenjualState {}

class SuccessAddRiwayatTransaksiDetailPenjualState extends KeranjangPenjualState {
  SuccessAddRiwayatTransaksiDetailPenjualState();
}

class ErrorAddRiwayatTransaksiDetailPenjualState extends KeranjangPenjualState {
  String message;
  ErrorAddRiwayatTransaksiDetailPenjualState({this.message = ""});
}