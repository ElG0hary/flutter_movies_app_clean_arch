import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/errors/failure.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_details.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_recommendations.dart';

abstract class BaseMovieDetailsRepository {
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId);
  Future<Either<Failure, List<MovieRecommendations>>>
      getCurrentMovieRecommendations(int movieId);
}
