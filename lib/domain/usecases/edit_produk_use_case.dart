import 'package:dartz/dartz.dart';
import 'package:growell/data/models/add_produk_model.dart';
import 'package:growell/data/models/add_user_model.dart';
import 'package:growell/data/models/edit_produk_model.dart';
import 'package:growell/data/parameters/add_produk_dto.dart';
import 'package:growell/data/parameters/add_user_dto.dart';
import 'package:growell/data/repositories/produk_repository.dart';
import 'package:growell/data/repositories/user_repository.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:growell/domain/usecases/base_use_case.dart';

class EditProdukUseCase{
  final ProdukRepository repository;

  EditProdukUseCase(this.repository);

  @override
  Future<Either<EditProdukModel, Error>> call({required AddProdukDTO params}) async {
    return await repository.editProduk(params);
  }
}
