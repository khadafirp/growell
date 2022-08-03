import 'package:growell/data/models/add_keranjang_produk_model.dart';
import 'package:growell/data/models/add_keranjang_toko_model.dart';
import 'package:growell/data/models/login_model.dart';
import 'package:growell/data/parameters/add_keranjang_produk_dto.dart';
import 'package:growell/data/parameters/add_keranjang_toko_dto.dart';
import 'package:growell/data/parameters/login_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/data/repositories/keranjang_produk_repository.dart';
import 'package:growell/data/repositories/user_repository.dart';

class AddKeranjangTokoUseCase {
  final KeranjangProdukRepository keranjangProdukRepository;
  AddKeranjangTokoUseCase(this.keranjangProdukRepository);

  @override
  Future<Either<AddKeranjangTokoModel, Error>> call({required AddKeranjangTokoDTO params}) async {
    return await keranjangProdukRepository.addKeranjangToko(params);
  }
}