
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
// import 'package:get/get_connect.dart';
import 'package:growell/base/network/base_service.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/datasource/base_url/base_url.dart';
import 'package:growell/data/models/add_riwayat_transaksi_model.dart';
import 'package:growell/data/models/add_user_model.dart';
import 'package:growell/data/models/detail_riwayat_transaksi_model.dart';
import 'package:growell/data/models/list_riwayat_transaksi_model.dart';
import 'package:growell/data/models/list_user_model.dart';
import 'package:growell/data/models/login_model.dart';
import 'package:growell/data/parameters/add_riwayat_transaksi_detail_dto.dart';
import 'package:growell/data/parameters/add_riwayat_transaksi_dto.dart';
import 'package:growell/data/parameters/add_user_dto.dart';
import 'package:growell/data/parameters/detail_riwayat_transaksi_dto.dart';
import 'package:growell/data/parameters/list_riwayat_transaksi_dto.dart';
import 'package:growell/data/parameters/login_dto.dart';
import 'package:http_parser/http_parser.dart';

abstract class RiwayatTransaksiDatasources {
  Future<Either<AddRiwayatTransaksiModel, Error>> addRiwayatTransaksi(AddRiwayatTransaksiDTO params);
  Future<Either<Success, Error>> addRiwayatTransaksiDetail(AddRiwayatTransaksiDetailDTO params);
  Future<Either<ListRiwayatTransaksiModel, Error>> listRiwayatTransaksi(ListRiwayatTransaksiDTO params);
  Future<Either<DetailRiwayatTransaksiModel, Error>> detailRiwayatTransaksi(DetailRiwayatTransaksiDTO params);
}

class RiwayatTransaksiDatasourcesImpl extends BaseService implements RiwayatTransaksiDatasources {
  
  static const String addRiwayatTransaksiUrl = "/riwayat-transaksi/add-riwayat-transaksi";
  static const String addRiwayatTransaksiDetailUrl = "/riwayat-transaksi/add-riwayat-transaksi-detail";
  static const String listRiwayatTransaksiUrl = "/riwayat-transaksi/list-riwayat-transaksi";
  static const String detailRiwayatTransaksiUrl = "/riwayat-transaksi/detail-riwayat-transaksi";

  @override
  Future<Either<AddRiwayatTransaksiModel, Error>> addRiwayatTransaksi(AddRiwayatTransaksiDTO params) async {
    final ResultResponse response = await callService(
      url: addRiwayatTransaksiUrl, 
      baseUrl: BaseUrl().baseUrl,
      method: BaseService.postMethod,
      dataBody: FormData.fromMap(
        {
          "id_riwayat_transaksi": params.id_riwayat_transaksi,
          "total_amount": params.total_amount,
          "status_transaksi": params.status_transaksi,
          "id_user": params.id_user,
          "id_toko": params.id_toko
        }
      )
    );

    if (response is Success) {
      var responseData = AddRiwayatTransaksiModel.fromJson(response.content['data']);
      return Left(responseData);
    } else {
      return Right(response as Error);
    }
  }

  @override
  Future<Either<Success, Error>> addRiwayatTransaksiDetail(AddRiwayatTransaksiDetailDTO params) async {
    final ResultResponse response = await callService(
      url: addRiwayatTransaksiDetailUrl, 
      baseUrl: BaseUrl().baseUrl,
      method: BaseService.postMethod,
      dataBody: FormData.fromMap(
        {
          "id_riwayat_transaksi_detail": params.id_riwayat_transaksi_detail,
          "id_riwayat_transaksi": params.id_riwayat_transaksi,
          "status_transaksi": params.status_transaksi,
          "id_user": params.id_user,
          "id_toko": params.id_toko,
          "nama_produk": params.nama_produk,
          "desc_produk": params.desc_produk,
          "harga_produk": params.harga_produk,
          "id_produk": params.id_produk,
          "created_at": params.created_at,
          "updated_at": params.updated_at,
          "jumlah_belanja": params.jumlah_belanja.toString()
        }
      )
    );

    if (response is Success) {
      return Left(response);
    } else {
      return Right(response as Error);
    }
  }

  @override
  Future<Either<ListRiwayatTransaksiModel, Error>> listRiwayatTransaksi(ListRiwayatTransaksiDTO params) async {
    final ResultResponse response = await callService(
      url: listRiwayatTransaksiUrl, 
      baseUrl: BaseUrl().baseUrl,
      method: BaseService.getMethod,
      queryParam:
        {
          "id_user": params.id_user!
        }
    );

    if (response is Success) {
      var responseData = ListRiwayatTransaksiModel.fromJson(response.content);
      return Left(responseData);
    } else {
      return Right(response as Error);
    }
  }

  @override
  Future<Either<DetailRiwayatTransaksiModel, Error>> detailRiwayatTransaksi(DetailRiwayatTransaksiDTO params) async {
    final ResultResponse response = await callService(
      url: detailRiwayatTransaksiUrl, 
      baseUrl: BaseUrl().baseUrl,
      method: BaseService.postMethod,
      dataBody: FormData.fromMap(
        {
          "id_riwayat_transaksi": params.id_riwayat_transaksi
        }
      )
    );

    if (response is Success) {
      var responseData = DetailRiwayatTransaksiModel.fromJson(response.content);
      return Left(responseData);
    } else {
      return Right(response as Error);
    }
  }
}