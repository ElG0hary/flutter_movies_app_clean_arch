import 'package:movies_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movies_clean_architecture/movies/domain/repositories/base_main_screen.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/base_use_case.dart';

class SearchMovieUseCase
    extends BaseMoviesUseCaseParameters<List<Movie>, String> {
  final BaseMainScreenMoviesRepository baseMainScreenMoviesRepository;

  SearchMovieUseCase(this.baseMainScreenMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(String parameters) async =>
      await baseMainScreenMoviesRepository.searchForMovie(parameters);
}
