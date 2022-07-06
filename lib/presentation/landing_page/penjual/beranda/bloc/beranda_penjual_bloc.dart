import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/domain/usecases/get_list_produk_penjual_use_case.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_event.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_state.dart';

class BerandaPenjualBloc extends Bloc<BerandaPenjualEvent, BerandaPenjualState>{
  
  final GetListProdukPenjualUseCase getListProdukPenjualUseCase;

  BerandaPenjualBloc(
    this.getListProdukPenjualUseCase
  ) : super(InitialBerandaPenjualState()){
    on<GetListProdukPenjualEvent>(getListProdukPenjual);
  }
  
  @override
  // ignore: avoid_renaming_method_parameters
  void onError(Object error, StackTrace stacktrace) {
    add(ThrowErrorBerandaPenjualEvent(error));
    super.onError(error, stacktrace);
  }

  void getListProdukPenjual(GetListProdukPenjualEvent event, Emitter<BerandaPenjualState> emit) async {
    emit(LoadingGetListProdukBerandaPenjualState());
    var response = await getListProdukPenjualUseCase(params: event.idUser!);
    emit(
      response.fold(
        (l) => SuccessGetListProdukBerandaPenjualState(
          entity: l.entity!
        ), 
        (r) => ErrorGetListProdukBerandaPenjualState(
          message: r.errorData.errorMessage
        )
      )
    );
  }
}