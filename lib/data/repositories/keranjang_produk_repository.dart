import 'package:dartz/dartz.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/datasource/keranjang_datasource.dart';
import 'package:growell/data/datasource/produk_datasource.dart';
import 'package:growell/data/models/add_keranjang_produk_model.dart';
import 'package:growell/data/models/add_keranjang_toko_model.dart';
import 'package:growell/data/models/add_produk_model.dart';
import 'package:growell/data/models/edit_produk_model.dart';
import 'package:growell/data/models/list_keranjang_produk_penjual_model.dart';
import 'package:growell/data/models/list_keranjang_toko_model.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';
import 'package:growell/data/parameters/add_keranjang_produk_dto.dart';
import 'package:growell/data/parameters/add_keranjang_toko_dto.dart';
import 'package:growell/data/parameters/add_produk_dto.dart';
import 'package:growell/data/parameters/get_list_keranjang_produk_dto.dart';

abstract class KeranjangProdukRepository {
  Future<Either<AddKeranjangProdukModel, Error>> adddKeranjangProduk(AddKeranjangProdukDTO params);
  Future<Either<ListKeranjangProdukModel, Error>> getListKeranjangProduk(GetListKeranjangProdukDTO params);
  Future<Either<AddKeranjangTokoModel, Error>> addKeranjangToko(AddKeranjangTokoDTO params);
  Future<Either<ListKeranjangTokoModel, Error>> getListKeranjangToko();
}

class KeranjangProdukRepositoryImpl extends KeranjangProdukRepository {
  final KeranjangDatasources produkDatasources;
  KeranjangProdukRepositoryImpl(this.produkDatasources);

  @override
  Future<Either<AddKeranjangProdukModel, Error>> adddKeranjangProduk(AddKeranjangProdukDTO params) {
    Future<Either<AddKeranjangProdukModel, Error>> response = produkDatasources.addKeranjangProduk(params);
    return response;
  }

  @override
  Future<Either<ListKeranjangProdukModel, Error>> getListKeranjangProduk(GetListKeranjangProdukDTO params) {
    Future<Either<ListKeranjangProdukModel, Error>> response = produkDatasources.getListKeranjangProduk(params);
    return response;
  }

  @override
  Future<Either<AddKeranjangTokoModel, Error>> addKeranjangToko(AddKeranjangTokoDTO params) {
    Future<Either<AddKeranjangTokoModel, Error>> response = produkDatasources.addKeranjangToko(params);
    return response;
  }

  @override
  Future<Either<ListKeranjangTokoModel, Error>> getListKeranjangToko() {
    Future<Either<ListKeranjangTokoModel, Error>> response = produkDatasources.getListKeranjangToko();
    return response;
  }
}