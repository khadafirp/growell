import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/domain/usecases/get_list_keranjang_toko_use_case.dart';
import 'package:growell/presentation/landing_page/pembeli/beranda/bloc/beranda_pembeli_event.dart';
import 'package:growell/presentation/landing_page/pembeli/beranda/bloc/beranda_pembeli_state.dart';

class BerandaPembeliBloc extends Bloc<BerandaPembeliEvent, BerandaPembeliState>{
  
  final GetListKeranjangTokoUseCase getListKeranjangTokoUseCase;

  BerandaPembeliBloc(
    this.getListKeranjangTokoUseCase
  ) : super(InitialBerandaPembeliState()){
    on<GetListKeranjangTokoPembeliEvent>(getListKeranjangToko);
  }
  
  @override
  // ignore: avoid_renaming_method_parameters
  void onError(Object error, StackTrace stacktrace) {
    add(ThrowErrorBerandaPembeliEvent(error));
    super.onError(error, stacktrace);
  }

  void getListKeranjangToko(GetListKeranjangTokoPembeliEvent event, Emitter<BerandaPembeliState> emit) async {
    emit(LoadingGetListTokoBerandaPembeliState());
    var response = await getListKeranjangTokoUseCase.call();
    emit(
      response.fold(
        (l) => SuccessGetListTokoBerandaPembeliState(
          entity: l.entity!.entity!
        ), 
        (r) => ErrorGetListTokoBerandaPembeliState(
          message: r.errorData.errorMessage
        )
      )
    );
  }
}