
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:growell/base/network/base_service.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/datasource/base_url/base_url.dart';
import 'package:growell/data/models/add_keranjang_produk_model.dart';
import 'package:growell/data/parameters/add_keranjang_produk_dto.dart';

abstract class KeranjangDatasources {
  Future<Either<AddKeranjangProdukModel, Error>> addKeranjangProduk(AddKeranjangProdukDTO params);
}

class KeranjangDatasourcesImpl extends BaseService implements KeranjangDatasources {

  static const String addKeranjangProdukUrl = "/keranjang-produk/add-keranjang-produk";

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
}