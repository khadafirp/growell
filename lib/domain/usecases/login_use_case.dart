import 'package:growell/data/models/login_model.dart';
import 'package:growell/data/parameters/login_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/repositories/user_repository.dart';

class LoginUseCase {
  final UserRepository loginRepository;
  LoginUseCase(this.loginRepository);

  @override
  Future<Either<LoginModel, Error>> login({required LoginDTO params}) async {
    return await loginRepository.login(params);
  }
}