import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/domain/usecases/add_produk_use_case.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_event.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_state.dart';

class AddProdukBloc extends Bloc<AddProdukEvent, AddProdukState>{

  AddProdukUseCase addProdukUseCase;

  AddProdukBloc(
    this.addProdukUseCase
  ) : super(InitialAddProdukState()){
    on<TambahProdukEvent>(addProduk);
  }

  @override
  // ignore: avoid_renaming_method_parameters
  void onError(Object error, StackTrace stacktrace) {
    add(ThrowErrorAddProdukEvent(error));
    super.onError(error, stacktrace);
  }

  void addProduk(TambahProdukEvent event, Emitter<AddProdukState> emit) async {
    emit(LoadingAddProdukState());
    var response = await addProdukUseCase(params: event.params!);
    emit(
      response.fold(
        (l) => SuccessAddProdukState(entity: l.entity), 
        (r) => ErrorAddProdukState(message: r.errorData.errorMessage)
      )
    );
  }

}