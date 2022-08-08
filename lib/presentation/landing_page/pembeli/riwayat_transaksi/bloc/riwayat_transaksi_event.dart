import 'package:growell/data/parameters/detail_riwayat_transaksi_dto.dart';
import 'package:growell/data/parameters/list_riwayat_transaksi_dto.dart';

class RiwayatTransaksiEvent {
  RiwayatTransaksiEvent();

  @override
  List<Object> get props => [];
}

class ThrowErrorRiwayatTransaksiState extends RiwayatTransaksiEvent{
  Object message;
  ThrowErrorRiwayatTransaksiState(this.message);
}

class GetListRiwayatTransaksiEvent extends RiwayatTransaksiEvent{
  ListRiwayatTransaksiDTO? params;
  GetListRiwayatTransaksiEvent({this.params});
}

class GetDetailRiwayatTransaksiEvent extends RiwayatTransaksiEvent{
  DetailRiwayatTransaksiDTO? params;
  GetDetailRiwayatTransaksiEvent({this.params});
}