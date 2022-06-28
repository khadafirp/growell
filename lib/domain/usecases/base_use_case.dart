import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<Type, Error>> call({required Params params});
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}