
import 'package:dartz/dartz.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/datasource/user_datasource.dart';
import 'package:growell/data/models/add_user_model.dart';
import 'package:growell/data/models/list_user_model.dart';
import 'package:growell/data/models/login_model.dart';
import 'package:growell/data/parameters/add_user_dto.dart';
import 'package:growell/data/parameters/login_dto.dart';

abstract class UserRepository {
  Future<Either<AddUserModel, Error>> addUser(AddUserDTO params);
  Future<Either<LoginModel, Error>> login(LoginDTO params);
  Future<Either<ListUserModel, Error>> showAllUser();
}

class UserRepositoryImpl extends UserRepository {
  UserDatasources userDatasources;

  UserRepositoryImpl(this.userDatasources);

  @override
  Future<Either<AddUserModel, Error>> addUser(AddUserDTO params){
    Future<Either<AddUserModel, Error>> response = userDatasources.addUser(params);
    return response;
  }

  @override
  Future<Either<LoginModel, Error>> login(LoginDTO params) {
    Future<Either<LoginModel, Error>> response = userDatasources.login(params);
    return response;
  }

  @override
  Future<Either<ListUserModel, Error>> showAllUser() {
    Future<Either<ListUserModel, Error>> response = userDatasources.showAllUser();
    return response;
  }
}