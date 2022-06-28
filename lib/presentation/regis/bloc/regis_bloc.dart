import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/models/add_user_model.dart';
import 'package:growell/domain/usecases/add_user_use_case.dart';
import 'package:growell/presentation/regis/bloc/regis_event.dart';
import 'package:growell/presentation/regis/bloc/regis_state.dart';

class RegisBloc extends Bloc<RegisEvent, RegisState>{
  AddUserUseCase addUserUseCase;

  RegisBloc(
    this.addUserUseCase
  ) : super(InitialRegisState()){
    on<DaftarEvent>(_registrasi);
  }

  @override
  // ignore: avoid_renaming_method_parameters
  void onError(Object error, StackTrace stacktrace) {
    add(ThrowErrorRegisEvent(error));
    super.onError(error, stacktrace);
  }

  void _registrasi(DaftarEvent event, Emitter<RegisState> emit) async {
    emit(LoadingRegisState());
    var response = await addUserUseCase.addUser(params: event.entity!);
    emit(
      response.fold(
        (left) => SuccessRegisState(
          data: left
        ), 
        (right) => ErrorRegisState(
          message: right.errorData.errorMessage
        )
      )
    );
  }
}