
import 'package:dartz/dartz.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/datasource/riwayat_transaksi_datasource.dart';
import 'package:growell/data/datasource/user_datasource.dart';
import 'package:growell/data/models/add_riwayat_transaksi_model.dart';
import 'package:growell/data/models/add_user_model.dart';
import 'package:growell/data/models/list_user_model.dart';
import 'package:growell/data/models/login_model.dart';
import 'package:growell/data/parameters/add_riwayat_transaksi_detail_dto.dart';
import 'package:growell/data/parameters/add_riwayat_transaksi_dto.dart';
import 'package:growell/data/parameters/add_user_dto.dart';
import 'package:growell/data/parameters/login_dto.dart';

abstract class RiwayatTransaksiRepository {
  Future<Either<AddRiwayatTransaksiModel, Error>> addRiwayatTransaksi(AddRiwayatTransaksiDTO params);
  Future<Either<Success, Error>> addRiwayatTransaksiDetail(AddRiwayatTransaksiDetailDTO params);
}

class RiwayatTransaksiRepositoryImpl extends RiwayatTransaksiRepository {
  RiwayatTransaksiDatasources riwayatTransaksiDatasources;

  RiwayatTransaksiRepositoryImpl(this.riwayatTransaksiDatasources);

  @override
  Future<Either<AddRiwayatTransaksiModel, Error>> addRiwayatTransaksi(AddRiwayatTransaksiDTO params){
    Future<Either<AddRiwayatTransaksiModel, Error>> response = riwayatTransaksiDatasources.addRiwayatTransaksi(params);
    return response;
  }

  @override
  Future<Either<Success, Error>> addRiwayatTransaksiDetail(AddRiwayatTransaksiDetailDTO params){
    Future<Either<Success, Error>> response = riwayatTransaksiDatasources.addRiwayatTransaksiDetail(params);
    return response;
  }
}