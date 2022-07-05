import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:growell/base/network/base_service.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/datasource/base_url/base_url.dart';
import 'package:growell/data/models/add_produk_model.dart';
import 'package:growell/data/models/add_user_model.dart';
import 'package:growell/data/models/login_model.dart';
import 'package:growell/data/parameters/add_produk_dto.dart';
import 'package:growell/data/parameters/add_user_dto.dart';
import 'package:growell/data/parameters/login_dto.dart';
import 'package:http_parser/http_parser.dart';

abstract class ProdukDatasources {
  Future<Either<AddProdukModel, Error>> addProduk(AddProdukDTO params);
}

class ProdukDatasourcesImpl extends BaseService implements ProdukDatasources {
  String addProdukUrl = "/produk/addProduk";

  @override
  Future<Either<AddProdukModel, Error>> addProduk(AddProdukDTO params) async {
    final String file = params.path == null ? "" : params.path!.split('/').last;
    final ResultResponse response = await callService(
      url: addProdukUrl, 
      baseUrl: BaseUrl().baseUrl,
      method: BaseService.postMethod,
      dataBody: FormData.fromMap(
        {
          "id_produk": params.id_produk,
          "nama_produk": params.nama_produk,
          "stok": params.stok,
          "id_kategori": params.id_kategori,
          "kode_barcode": params.kode_barcode,
          "id_user": params.id_user,
          "path": params.path!.isEmpty ? "" : await MultipartFile.fromFile(params.path!, filename: file, contentType: MediaType("image", "jpg")),
          "size": params.size
        }
      )
    );

    if(response is Success){
      final responseData = AddProdukModel.fromJson(response.content);
      return Left(responseData);
    }else{
      return Right(response as Error);
    }
  }
}