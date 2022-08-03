
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:growell/base/network/base_service.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/datasource/base_url/base_url.dart';
import 'package:growell/data/models/add_keranjang_produk_model.dart';
import 'package:growell/data/models/add_keranjang_toko_model.dart';
import 'package:growell/data/models/list_keranjang_produk_penjual_model.dart';
import 'package:growell/data/models/list_keranjang_toko_model.dart';
import 'package:growell/data/parameters/add_keranjang_produk_dto.dart';
import 'package:growell/data/parameters/add_keranjang_toko_dto.dart';

abstract class KeranjangDatasources {
  Future<Either<AddKeranjangProdukModel, Error>> addKeranjangProduk(AddKeranjangProdukDTO params);
  Future<Either<ListKeranjangProdukModel, Error>> getListKeranjangProduk(String params);
  Future<Either<AddKeranjangTokoModel, Error>> addKeranjangToko(AddKeranjangTokoDTO params);
  Future<Either<ListKeranjangTokoModel, Error>> getListKeranjangToko();
}

class KeranjangDatasourcesImpl extends BaseService implements KeranjangDatasources {

  static const String addKeranjangTokoUrl = "/keranjang-toko/tambah-keranjang-toko";
  static const String addKeranjangProdukUrl = "/keranjang-produk/add-keranjang-produk";
  static const String listKeranjangProdukUrl = "/keranjang-produk/list-produk";
  static const String listKeranjangTokoUrl = "/keranjang-toko/list-keranjang-toko";

  @override
  Future<Either<AddKeranjangTokoModel, Error>> addKeranjangToko(AddKeranjangTokoDTO params) async {
    final ResultResponse response = await callService(
      url: addKeranjangTokoUrl, 
      baseUrl: BaseUrl().baseUrl,
      method: BaseService.postMethod,
      dataBody: FormData.fromMap(
        {
          "id_keranjang_toko": params.id_keranjang_toko,
          "id_user": params.id_user,
        }
      )
    );

    if (response is Success) {
      final responseData = AddKeranjangTokoModel.fromJson(response.content);
      return Left(responseData);
    } else {
      return Right(response as Error);
    }
  }

  @override
  Future<Either<AddKeranjangProdukModel, Error>> addKeranjangProduk(AddKeranjangProdukDTO params) async {
    final ResultResponse response = await callService(
      url: addKeranjangProdukUrl, 
      baseUrl: BaseUrl().baseUrl,
      method: BaseService.postMethod,
      dataBody: FormData.fromMap(
        {
          "id_keranjang_produk": params.id_keranjang_produk,
          "id_produk": params.id_produk,
          "nama_produk": params.nama_produk,
          "kode_produk": params.kode_barcode,
          "id_user": params.id_user,
          "harga_produk": params.harga_produk,
          "detail_produk": params.detail_produk,
          "kode_barcode": params.kode_barcode,
          "created_at": params.created_at,
          "path": params.path,
          "id_keranjang_toko": params.id_keranjang_toko,
          "total_amount": params.total_amount,
          "jumlah_belanjaan": params.jumlah_belanjaan,
          "edited_at": params.edited_at
        }
      )
    );

    if (response is Success) {
      final responseData = AddKeranjangProdukModel.fromJson(response.content);
      return Left(responseData);
    } else {
      return Right(response as Error);
    }
  }

  @override
  Future<Either<ListKeranjangProdukModel, Error>> getListKeranjangProduk(String params) async {
    ResultResponse response = await callService(
      url: listKeranjangProdukUrl, 
      baseUrl: BaseUrl().baseUrl,
      method: BaseService.getMethod,
      queryParam: 
        {
          "id_keranjang_toko": params
        }
    );

    if(response is Success){
      final responseData = ListKeranjangProdukModel.fromJson(response.content['data']);
      return Left(responseData);
    } else {
      return Right(response as Error);
    }
  }

  @override
  Future<Either<ListKeranjangTokoModel, Error>> getListKeranjangToko() async {
    ResultResponse response = await callService(
      url: listKeranjangTokoUrl, 
      baseUrl: BaseUrl().baseUrl,
      method: BaseService.getMethod,
    );

    print("keranjang toko = " + response.content.toString());

    if(response is Success){
      final responseData = ListKeranjangTokoModel.fromJson(response.content['data']);
      return Left(responseData);
    } else {
      return Right(response as Error);
    }
  }
}