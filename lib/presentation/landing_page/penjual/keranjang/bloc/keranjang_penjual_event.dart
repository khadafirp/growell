import 'package:growell/data/parameters/add_keranjang_produk_dto.dart';
import 'package:growell/data/parameters/add_riwayat_transaksi_detail_dto.dart';
import 'package:growell/data/parameters/add_riwayat_transaksi_dto.dart';
import 'package:growell/data/parameters/get_list_keranjang_produk_dto.dart';

class KeranjangPenjualEvent {
  KeranjangPenjualEvent();

  @override
  List<Object> get props => [];
}

class AddKeranjangPenjualEvent extends KeranjangPenjualEvent {
  AddKeranjangProdukDTO? params;
  AddKeranjangPenjualEvent({this.params});
}

class ThrowErrorAddKeranjangPenjual extends AddKeranjangPenjualEvent{
  Object message;
  ThrowErrorAddKeranjangPenjual({required this.message});
}

class GetListKeranjangProdukPenjualEvent extends KeranjangPenjualEvent {
  GetListKeranjangProdukDTO? params;
  GetListKeranjangProdukPenjualEvent({this.params});
}

class AddRiwayatTransaksiEvent extends KeranjangPenjualEvent{
  AddRiwayatTransaksiDTO? params;
  AddRiwayatTransaksiEvent({this.params});
}

class AddRiwayatTransaksiDetailEvent extends KeranjangPenjualEvent{
  AddRiwayatTransaksiDetailDTO? params;
  AddRiwayatTransaksiDetailEvent({this.params});
}