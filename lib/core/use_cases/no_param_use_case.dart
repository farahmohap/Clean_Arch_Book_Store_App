//Generics UseCase
import 'package:bookly/core/errors/faliure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type> {
  Future<Either<Faliure, Type>> call();
}
