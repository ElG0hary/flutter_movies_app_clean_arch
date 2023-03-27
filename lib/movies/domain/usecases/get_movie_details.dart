import 'package:movies_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_details.dart';
import 'package:movies_clean_architecture/movies/domain/repositories/base_movie_details_screen.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/base_use_case.dart';

class GetMovieDetailsUseCase
    extends BaseMoviesUseCaseParameters<MovieDetails, int> {
  final BaseMovieDetailsRepository _baseMovieDetailsRepository;

  GetMovieDetailsUseCase(this._baseMovieDetailsRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(int parameters) async =>
      await _baseMovieDetailsRepository.getMovieDetails(parameters);
}
