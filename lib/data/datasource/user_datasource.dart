import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:growell/base/network/base_service.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/datasource/base_url/base_url.dart';
import 'package:growell/data/models/add_user_model.dart';
import 'package:growell/data/parameters/add_user_dto.dart';

abstract class UserDatasources {
  Future<Either<AddUserModel, Error>> addUser(AddUserDTO params);
}

class UserDatasourcesImpl extends BaseService implements UserDatasources {
  String addUserUrl = "/addUser";

  @override
  Future<Either<AddUserModel, Error>> addUser(AddUserDTO params) async {
    final ResultResponse response = await callService(
      url: addUserUrl, 
      baseUrl: BaseUrl().baseUrl,
      method: BaseService.postMethod,
      queryParam: {
        "id_user": params.idUser!,
        "username": params.username!,
        "password": params.password!,
        "email": params.email!,
        "no_telp": params.noTelp!,
        "user_kategori": params.userKategori!,
        "alamat_toko": params.alamatToko!,
        "nama_toko": params.namaToko!,
        "desc_toko": params.descToko!,
        "path": MultipartFile(params.path, filename: params.path!.filename),
        "fullname": params.fullname!
      }
    );

    if (response is Success) {
      final responseData = AddUserModel.fromJson(response);
      return Left(responseData);
    } else {
      return Right(response as Error);
    }
  }
}