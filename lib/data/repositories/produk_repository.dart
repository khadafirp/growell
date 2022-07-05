import 'package:dartz/dartz.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/datasource/produk_datasource.dart';
import 'package:growell/data/models/add_produk_model.dart';
import 'package:growell/data/parameters/add_produk_dto.dart';

abstract class ProdukRepository {
  Future<Either<AddProdukModel, Error>> addProduk(AddProdukDTO params);
}

class ProdukRepositoryImpl extends ProdukRepository {
  final ProdukDatasources produkDatasources;
  ProdukRepositoryImpl(this.produkDatasources);

  @override
  Future<Either<AddProdukModel, Error>> addProduk(AddProdukDTO params) {
    Future<Either<AddProdukModel, Error>> response = produkDatasources.addProduk(params);
    return response;
  }
}