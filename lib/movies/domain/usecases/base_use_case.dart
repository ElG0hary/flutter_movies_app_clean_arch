import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/errors/failure.dart';

abstract class BaseMoviesUseCaseNoParameters<T> {
  Future<Either<Failure, T>> call();
}

abstract class BaseMoviesUseCaseParameters<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}