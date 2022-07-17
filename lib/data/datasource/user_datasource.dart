
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
// import 'package:get/get_connect.dart';
import 'package:growell/base/network/base_service.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/datasource/base_url/base_url.dart';
import 'package:growell/data/models/add_user_model.dart';
import 'package:growell/data/models/list_user_model.dart';
import 'package:growell/data/models/login_model.dart';
import 'package:growell/data/parameters/add_user_dto.dart';
import 'package:growell/data/parameters/login_dto.dart';
import 'package:http_parser/http_parser.dart';

abstract class UserDatasources {
  Future<Either<AddUserModel, Error>> addUser(AddUserDTO params);
  Future<Either<LoginModel, Error>> login(LoginDTO params);
  Future<Either<ListUserModel, Error>> showAllUser();
}

class UserDatasourcesImpl extends BaseService implements UserDatasources {
  String addUserUrl = "/user/register";
  String loginUrl = "/user/login";
  String listUserUrl = "/user/showAllUser";

  @override
  Future<Either<AddUserModel, Error>> addUser(AddUserDTO params) async {
    final String file = params.path == null ? "" : params.path!.split('/').last;
    final ResultResponse response = await callService(
      url: addUserUrl, 
      baseUrl: BaseUrl().baseUrl,
      method: BaseService.postMethod,
      dataBody: FormData.fromMap(
        {
          "id_user": params.idUser!,
          "username": params.username!,
          "password": params.password!,
          "email": params.email!,
          "no_telp": params.noTelp!,
          "user_kategori": params.userKategori!,
          "alamat_toko": params.alamatToko!,
          "nama_toko": params.namaToko!,
          "desc_toko": params.descToko!,
          "path": params.path!.isEmpty ? "" : await MultipartFile.fromFile(params.path!, filename: file, contentType: MediaType("image", "jpg")
          ),
          "fullname": params.fullname!
        }
      )
    );

    if (response is Success) {
      final responseData = AddUserModel.fromJson(response.content);
      return Left(responseData);
    } else {
      return Right(response as Error);
    }
  }

  @override
  Future<Either<LoginModel, Error>> login(LoginDTO params) async {
    ResultResponse response = await callService(
      url: loginUrl, 
      baseUrl: BaseUrl().baseUrl,
      method: BaseService.getMethod,
      queryParam: 
        {
          "username": params.username!,
          "password": params.password!
        }
    );

    if(response is Success){
      final responseData = LoginModel.fromJson(response.content['data']);
      return Left(responseData);
    } else {
      return Right(response as Error);
    }
  }

  @override
  Future<Either<ListUserModel, Error>> showAllUser() async {
    ResultResponse response = await callService(
      url: listUserUrl, 
      baseUrl: BaseUrl().baseUrl,
      method: BaseService.getMethod,
    );

    if(response is Success){
      final responseData = ListUserModel.fromJson(response.content['data']);
      return Left(responseData);
    } else {
      return Right(response as Error);
    }
  }
}