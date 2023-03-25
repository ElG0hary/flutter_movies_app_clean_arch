import 'package:movies_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movies_clean_architecture/movies/domain/repositories/base_movie_repository.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/base_use_case.dart';

class GetTopRatedMoviesUseCase
    extends BaseMoviesUseCaseNoParameters<List<Movie>> {
  final BaseMoviesRepository _movieRepository;

  GetTopRatedMoviesUseCase(this._movieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async =>
      await _movieRepository.getTopRatedMovies();
}
