import 'package:movies_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_recommendations.dart';
import 'package:movies_clean_architecture/movies/domain/repositories/base_movie_details_screen.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/base_use_case.dart';

class GetCurrentMovieRecommendationsUseCase
    extends BaseMoviesUseCaseParameters<List<MovieRecommendations>, int> {
  final BaseMovieDetailsRepository _baseMovieScreenRecommendations;

  GetCurrentMovieRecommendationsUseCase(this._baseMovieScreenRecommendations);
  @override
  Future<Either<Failure, List<MovieRecommendations>>> call(
          int parameters) async =>
      await _baseMovieScreenRecommendations
          .getCurrentMovieRecommendations(parameters);
}
