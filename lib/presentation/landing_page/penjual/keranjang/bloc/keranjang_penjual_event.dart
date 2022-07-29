import 'package:growell/data/parameters/add_keranjang_produk_dto.dart';

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
  String? idUser;
  GetListKeranjangProdukPenjualEvent({this.idUser});
}