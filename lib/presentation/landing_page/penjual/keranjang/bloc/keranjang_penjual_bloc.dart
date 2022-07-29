import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/domain/usecases/add_keranjang_produk_penjual_use_case.dart';
import 'package:growell/domain/usecases/add_produk_use_case.dart';
import 'package:growell/domain/usecases/edit_produk_use_case.dart';
import 'package:growell/domain/usecases/get_list_keranjang_produk_penjual_use_case.dart';
import 'package:growell/domain/usecases/get_list_produk_penjual_use_case.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_event.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_state.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/bloc/keranjang_penjual_event.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/bloc/keranjang_penjual_state.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_event.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_state.dart';

class KeranjangPenjualBloc extends Bloc<KeranjangPenjualEvent, KeranjangPenjualState>{

  AddKeranjangProdukPenjualUseCase? addKeranjangProdukPenjualUseCase;
  GetListKeranjangProdukPenjualUseCase? getListKeranjangProdukPenjualUseCase;

  KeranjangPenjualBloc(
    this.addKeranjangProdukPenjualUseCase,
    this.getListKeranjangProdukPenjualUseCase
  ) : super(InitialKeranjangPenjualState()){
    on<AddKeranjangPenjualEvent>(addKeranjangProduk);
    on<GetListKeranjangProdukPenjualEvent>(getListKeranjangProdukPenjual);
  }

  @override
  // ignore: avoid_renaming_method_parameters
  void onError(Object error, StackTrace stacktrace) {
    add(ThrowErrorAddKeranjangPenjual(message: error));
    super.onError(error, stacktrace);
  }

  void addKeranjangProduk(AddKeranjangPenjualEvent event, Emitter<KeranjangPenjualState> emit) async {
    emit(LoadingKeranjangPenjualState());
    var response = await addKeranjangProdukPenjualUseCase!.call(params: event.params!);
    emit(
      response.fold(
        (l) => LoadedKeranjangPenjualState(entity: l.entity), 
        (r) => ErrorKeranjangPenjualState(message: r.errorData.errorMessage)
      )
    );
  }

  void getListKeranjangProdukPenjual(GetListKeranjangProdukPenjualEvent event, Emitter<KeranjangPenjualState> emit) async {
    emit(LoadingGetListKeranjangProdukPenjualState());
    var response = await getListKeranjangProdukPenjualUseCase!.call(params: event.idUser!);
    emit(
      response.fold(
        (l) => SuccessGetListKeranjangProdukPenjualState(
          entity: l.entity!
        ), 
        (r) => ErrorGetListKeranjangProdukPenjualState(
          message: r.errorData.errorMessage
        )
      )
    );
  }
}