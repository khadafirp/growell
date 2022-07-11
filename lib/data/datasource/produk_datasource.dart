import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:growell/base/network/base_service.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/datasource/base_url/base_url.dart';
import 'package:growell/data/models/add_produk_model.dart';
import 'package:growell/data/models/add_user_model.dart';
import 'package:growell/data/models/edit_produk_model.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';
import 'package:growell/data/models/login_model.dart';
import 'package:growell/data/parameters/add_produk_dto.dart';
import 'package:growell/data/parameters/add_user_dto.dart';
import 'package:growell/data/parameters/login_dto.dart';
import 'package:http_parser/http_parser.dart';

abstract class ProdukDatasources {
  Future<Either<AddProdukModel, Error>> addProduk(AddProdukDTO params);
  Future<Either<ListProdukPenjualModel, Error>> listProduk(String params);
  Future<Either<EditProdukModel, Error>> editProduk(AddProdukDTO params);
}

class ProdukDatasourcesImpl extends BaseService implements ProdukDatasources {
  String addProdukUrl = "/produk/addProduk";
  String listProdukPenjualUrl = "/produk/listProduk";
  String editProdukUrl = "/produk/editProduk";

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
          "size": params.size,
          "harga_produk": params.harga_produk,
          "detail_produk": params.detail_produk
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

  @override
  Future<Either<EditProdukModel, Error>> editProduk(AddProdukDTO params) async {
    final String file = params.path == null ? "" : params.path!.split('/').last;
    final ResultResponse response = await callService(
      url: editProdukUrl, 
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
          "path": Uri.parse(params.path!).isAbsolute ? params.path!
              : await MultipartFile.fromFile(params.path!, filename: file, contentType: MediaType("image", "jpg")),
          "size": params.size,
          "harga_produk": params.harga_produk,
          "detail_produk": params.detail_produk
        }
      )
    );

    if(response is Success){
      final responseData = EditProdukModel.fromJson(response.content);
      return Left(responseData);
    }else{
      return Right(response as Error);
    }
  }

  @override
  Future<Either<ListProdukPenjualModel, Error>> listProduk(String params) async {
    final ResultResponse response = await callService(
      url: listProdukPenjualUrl, 
      baseUrl: BaseUrl().baseUrl,
      method: BaseService.postMethod,
      dataBody: FormData.fromMap(
        {
          "id_user": params
        }
      )
    );

    if(response is Success){
      final responseData = ListProdukPenjualModel.fromJson(response.content['data']);
      return Left(responseData);
    }else{
      return Right(response as Error);
    }
  }
}