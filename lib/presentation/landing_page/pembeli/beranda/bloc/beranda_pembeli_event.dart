class BerandaPembeliEvent {
  BerandaPembeliEvent();

  @override
  List<Object> get props => [];
}

class ThrowErrorBerandaPembeliEvent extends BerandaPembeliEvent {
  Object error;
  ThrowErrorBerandaPembeliEvent(this.error);
}

class GetListKeranjangTokoPembeliEvent extends BerandaPembeliEvent {
  GetListKeranjangTokoPembeliEvent();
}