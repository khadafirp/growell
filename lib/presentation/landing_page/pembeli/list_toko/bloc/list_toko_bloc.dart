import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/data/models/list_user_model.dart';
import 'package:growell/domain/usecases/get_list_all_user_use_case.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/bloc/list_toko_event.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/bloc/list_toko_state.dart';

class ListTokoBloc extends Bloc<ListTokoEvent, ListTokoState>{
  
  final GetListAllUserUseCase getListAllUserUseCase;

  ListTokoBloc(
    this.getListAllUserUseCase
  ) : super(InitialListTokoState()){
    on<GetListTokoEvent>(getListAllUser);
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
}