import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/domain/usecases/add_produk_use_case.dart';
import 'package:growell/domain/usecases/edit_produk_use_case.dart';
import 'package:growell/domain/usecases/get_list_produk_penjual_use_case.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_event.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_state.dart';

class AddProdukBloc extends Bloc<AddProdukEvent, AddProdukState>{

  AddProdukUseCase addProdukUseCase;
  GetListProdukPenjualUseCase getListProdukPenjualUseCase;
  EditProdukUseCase editProdukUseCase;

  AddProdukBloc(
    this.addProdukUseCase,
    this.getListProdukPenjualUseCase,
    this.editProdukUseCase
  ) : super(InitialAddProdukState()){
    on<TambahProdukEvent>(addProduk);
    on<GetListProdukPenjualEvent>(getListProdukPenjual);
    on<EditProdukEvent>(editProduk);
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

  void editProduk(EditProdukEvent event, Emitter<AddProdukState> emit) async {
    emit(LoadingEditProdukState());
    var response = await editProdukUseCase(params: event.params!);
    emit(
      response.fold(
        (l) => SuccessEditProdukState(entity: l.entity), 
        (r) => ErrorEditProdukState(message: r.errorData.errorMessage)
      )
    );
  }

  void getListProdukPenjual(GetListProdukPenjualEvent event, Emitter<AddProdukState> emit) async {
    emit(LoadingGetListProdukPenjual());
    var response = await getListProdukPenjualUseCase.call(params: event.params!);
    emit(
      response.fold(
        (l) => SuccessGetListProdukPenjualState(
          entity: l.entity!.entity
        ), 
        (r) => ErrorGetListProdukPenjualState(
          message: r.errorData.errorMessage
        )
      )
    );
  }
}