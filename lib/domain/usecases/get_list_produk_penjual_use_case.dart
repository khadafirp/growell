import 'package:dartz/dartz.dart';
import 'package:growell/data/models/add_produk_model.dart';
import 'package:growell/data/models/add_user_model.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';
import 'package:growell/data/parameters/add_produk_dto.dart';
import 'package:growell/data/parameters/add_user_dto.dart';
import 'package:growell/data/repositories/produk_repository.dart';
import 'package:growell/data/repositories/user_repository.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/domain/usecases/base_use_case.dart';

class GetListProdukPenjualUseCase{
  final ProdukRepository repository;

  GetListProdukPenjualUseCase(this.repository);

  @override
  Future<Either<ListProdukPenjualModel, Error>> call({required String params}) async {
    return await repository.listProduk(params);
  }
}
