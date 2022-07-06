class BerandaPenjualEvent {
  BerandaPenjualEvent();

  @override
  List<Object> get props => [];
}

class ThrowErrorBerandaPenjualEvent extends BerandaPenjualEvent {
  Object error;
  ThrowErrorBerandaPenjualEvent(this.error);
}

class GetListProdukPenjualEvent extends BerandaPenjualEvent {
  String? idUser;
  GetListProdukPenjualEvent({this.idUser});
}