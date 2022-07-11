import 'package:growell/data/parameters/add_produk_dto.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_event.dart';

class AddProdukEvent {
  AddProdukEvent();

  @override
  List<Object> get props => [];
}

class TambahProdukEvent extends AddProdukEvent {
  AddProdukDTO? params;
  TambahProdukEvent({this.params});
}

class ThrowErrorAddProdukEvent extends AddProdukEvent{
  Object? error;
  ThrowErrorAddProdukEvent(this.error);
}

class GetListProdukPenjualEvent extends AddProdukEvent {
  String? params;
  GetListProdukPenjualEvent({this.params});
}

class EditProdukEvent extends AddProdukEvent{
  AddProdukDTO? params;
  EditProdukEvent({this.params});
}