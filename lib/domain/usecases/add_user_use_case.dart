import 'package:dartz/dartz.dart';
import 'package:growell/data/models/add_user_model.dart';
import 'package:growell/data/parameters/add_user_dto.dart';
import 'package:growell/data/repositories/user_repository.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/domain/usecases/base_use_case.dart';

class AddUserUseCase{
  final UserRepository repository;

  AddUserUseCase(this.repository);

  @override
  Future<Either<AddUserModel, Error>> addUser({required AddUserDTO params}) async {
    return await repository.addUser(params);
  }
}
