import 'package:growell/data/models/detail_riwayat_transaksi_model.dart';
import 'package:growell/data/models/list_riwayat_transaksi_model.dart';

class RiwayatTransaksiState {
  RiwayatTransaksiState();

  @override
  List<Object> get props => [];
}

class InitialGetListRiwayatTransaksiState extends RiwayatTransaksiState{}

class LoadingGetListRiwayatTransaksiState extends RiwayatTransaksiState{}

class LoadedGetListRiwayatTransaksiState extends RiwayatTransaksiState {
  ListRiwayatTransaksiEntity? entity;
  LoadedGetListRiwayatTransaksiState({this.entity});
}

class ErrorGetListRiwayatTransaksiState extends RiwayatTransaksiState {
  String message;
  ErrorGetListRiwayatTransaksiState({this.message = ""});
}

class LoadingGetDetailRiwayatTransaksiState extends RiwayatTransaksiState{}

class LoadedGetDetailRiwayatTransaksiState extends RiwayatTransaksiState {
  DetailRiwayatTransaksiEntity? entity;
  LoadedGetDetailRiwayatTransaksiState({this.entity});
}

class ErrorGetDetailRiwayatTransaksiState extends RiwayatTransaksiState {
  String message;
  ErrorGetDetailRiwayatTransaksiState({this.message = ""});
}