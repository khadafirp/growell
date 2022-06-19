import 'package:either_dart/either.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/datasource/user_datasource.dart';
import 'package:growell/data/models/add_user_model.dart';
import 'package:growell/data/parameters/add_user_dto.dart';

abstract class AddUserRepository {
  Future<Either<AddUserModel, Error>> addUser(AddUserDTO addUserDTO);
}

class AddUserRepositoryImpl extends AddUserRepository {
  UserDatasources userDatasources;

  AddUserRepositoryImpl({required this.userDatasources});

  @override
  Future<Either<AddUserModel, Error>> addUser(AddUserDTO params){
    Future<Either<AddUserModel, Error>> response = userDatasources.addUser(params);
    return response;
  }
}