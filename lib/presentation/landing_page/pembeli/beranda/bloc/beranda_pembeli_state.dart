import 'package:growell/data/models/list_keranjang_toko_model.dart';
import 'package:growell/presentation/landing_page/Pembeli/beranda/bloc/beranda_Pembeli_event.dart';

class BerandaPembeliState {
  BerandaPembeliState();

  @override
  List<Object> get props => [];
}

class InitialBerandaPembeliState extends BerandaPembeliState {}

class LoadingGetListTokoBerandaPembeliState extends BerandaPembeliState {}

class SuccessGetListTokoBerandaPembeliState extends BerandaPembeliState {
  List<ListKeranjangPemilikTokoEntity>? entity;
  SuccessGetListTokoBerandaPembeliState({this.entity});
}

class ErrorGetListTokoBerandaPembeliState extends BerandaPembeliState {
  String message;
  ErrorGetListTokoBerandaPembeliState({this.message = ""});
}