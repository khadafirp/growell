import 'package:dartz/dartz.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/datasource/produk_datasource.dart';
import 'package:growell/data/models/add_produk_model.dart';
import 'package:growell/data/models/edit_produk_model.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';
import 'package:growell/data/parameters/add_produk_dto.dart';

abstract class ProdukRepository {
  Future<Either<AddProdukModel, Error>> addProduk(AddProdukDTO params);
  Future<Either<ListProdukPenjualModel, Error>> listProduk(String params);
  Future<Either<EditProdukModel, Error>> editProduk(AddProdukDTO params);
}

class ProdukRepositoryImpl extends ProdukRepository {
  final ProdukDatasources produkDatasources;
  ProdukRepositoryImpl(this.produkDatasources);

  @override
  Future<Either<AddProdukModel, Error>> addProduk(AddProdukDTO params) {
    Future<Either<AddProdukModel, Error>> response = produkDatasources.addProduk(params);
    return response;
  }

  @override
  Future<Either<ListProdukPenjualModel, Error>> listProduk(String params) {
    Future<Either<ListProdukPenjualModel, Error>> response = produkDatasources.listProduk(params);
    return response;
  }

  @override
  Future<Either<EditProdukModel, Error>> editProduk(AddProdukDTO params) {
    Future<Either<EditProdukModel, Error>> response = produkDatasources.editProduk(params);
    return response;
  }
}