import 'package:growell/data/parameters/add_produk_dto.dart';

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