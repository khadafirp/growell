import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/data/models/list_user_model.dart';
import 'package:growell/data/parameters/add_keranjang_toko_dto.dart';
import 'package:growell/domain/usecases/add_keranjang_toko_use_case.dart';
import 'package:growell/domain/usecases/get_list_all_user_use_case.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/bloc/list_toko_event.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/bloc/list_toko_state.dart';

class ListTokoBloc extends Bloc<ListTokoEvent, ListTokoState>{
  
  final GetListAllUserUseCase getListAllUserUseCase;
  final AddKeranjangTokoUseCase addKeranjangTokoUseCase;

  ListTokoBloc(
    this.getListAllUserUseCase,
    this.addKeranjangTokoUseCase
  ) : super(InitialListTokoState()){
    on<GetListTokoEvent>(getListAllUser);
    on<AddKeranjangTokoEvent>(addKeranjangToko);
  }
  
  @override
  // ignore: avoid_renaming_method_parameters
  void onError(Object error, StackTrace stacktrace) {
    add(ThrowErrorListTokoState(error));
    super.onError(error, stacktrace);
  }

  void getListAllUser(ListTokoEvent event, Emitter<ListTokoState> emit) async {
    emit(LoadingGetListTokoState());

    var response = await getListAllUserUseCase.call();

    emit(
      response.fold(
        (l) => SuccessGetListTokoState(entity: l.entity!.entity), 
        (r) => ErrorListTokoState(
          message: r.errorData.errorMessage
        )
      )
    );
  }

  void addKeranjangToko(AddKeranjangTokoEvent event, Emitter<ListTokoState> emit) async {
    emit(LoadingAddKeranjangTokoState());

    var response = await addKeranjangTokoUseCase.call(
      params: AddKeranjangTokoDTO(
        id_keranjang_toko: event.params!.id_keranjang_toko,
        id_user: event.params!.id_user
      )
    );

    emit(
      response.fold(
        (l) => SuccessAddKeranjangTokoState(entity: l.entity!), 
        (r) => ErrorAddKeranjangTokoTokoState(
          message: r.errorData.errorMessage
        )
      )
    );
  }
}