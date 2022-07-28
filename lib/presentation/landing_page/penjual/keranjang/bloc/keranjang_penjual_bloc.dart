import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/domain/usecases/add_keranjang_produk_penjual_use_case.dart';
import 'package:growell/domain/usecases/add_produk_use_case.dart';
import 'package:growell/domain/usecases/edit_produk_use_case.dart';
import 'package:growell/domain/usecases/get_list_produk_penjual_use_case.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/bloc/keranjang_penjual_event.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/bloc/keranjang_penjual_state.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_event.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_state.dart';

class KeranjangPenjualBloc extends Bloc<KeranjangPenjualEvent, KeranjangPenjualState>{

  AddKeranjangProdukPenjualUseCase? addKeranjangProdukPenjualUseCase;

  KeranjangPenjualBloc(
    this.addKeranjangProdukPenjualUseCase
  ) : super(InitialKeranjangPenjualState()){
    on<AddKeranjangPenjualEvent>(addKeranjangProduk);
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
}