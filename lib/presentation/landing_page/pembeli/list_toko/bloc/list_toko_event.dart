import 'package:growell/data/parameters/add_keranjang_toko_dto.dart';

class ListTokoEvent {
  ListTokoEvent();

  @override
  List<Object> get props => [];
}

class GetListTokoEvent extends ListTokoEvent{}

class ThrowErrorListTokoState extends ListTokoEvent{
  Object message;
  ThrowErrorListTokoState(this.message);
}

class AddKeranjangTokoEvent extends ListTokoEvent {
  AddKeranjangTokoDTO? params;
  AddKeranjangTokoEvent({this.params});
}