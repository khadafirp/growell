import 'package:either_dart/either.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/models/add_user_model.dart';
import 'package:growell/data/parameters/add_user_dto.dart';
import 'package:growell/data/repositories/add_user_repository.dart';

abstract class AddUserUseCase {

}

class AddUserUseCaseImpl extends AddUserUseCase {
  AddUserRepository? addUserRepository;
  AddUserUseCaseImpl({this.addUserRepository});

  @override
  Future<Either<AddUserModel, Error>> addUser(AddUserDTO params){
    Future<Either<AddUserModel, Error>> response = addUserRepository!.addUser(params);
    return response;
  }
}