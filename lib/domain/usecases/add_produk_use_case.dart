import 'package:dartz/dartz.dart';
import 'package:growell/data/models/add_produk_model.dart';
import 'package:growell/data/models/add_user_model.dart';
import 'package:growell/data/parameters/add_produk_dto.dart';
import 'package:growell/data/parameters/add_user_dto.dart';
import 'package:growell/data/repositories/produk_repository.dart';
import 'package:growell/data/repositories/user_repository.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/domain/usecases/base_use_case.dart';

class AddProdukUseCase{
  final ProdukRepository repository;

  AddProdukUseCase(this.repository);

  @override
  Future<Either<AddProdukModel, Error>> call({required AddProdukDTO params}) async {
    return await repository.addProduk(params);
  }
}
