import 'package:movies_clean_architecture/core/errors/exceptions.dart';
import 'package:movies_clean_architecture/movies/data/datasources/movie_details_remote_data_source.dart';
import 'package:movies_clean_architecture/movies/data/models/movie_recommendations_model.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_details.dart';
import 'package:movies_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_recommendations.dart';
import 'package:movies_clean_architecture/movies/domain/repositories/base_movie_details_screen.dart';

class MovieDetailsRepository extends BaseMovieDetailsRepository {
  final BaseMovieDetailsRemoteDataSource _baseMovieDetailsRemoteDataSource;

  MovieDetailsRepository(this._baseMovieDetailsRemoteDataSource);
  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId) async {
    final result =
        await _baseMovieDetailsRemoteDataSource.getCurrentMovieDetails(movieId);
    return _movieDetailsOrFailure(result);
  }

  @override
  Future<Either<Failure, List<MovieRecommendations>>>
      getCurrentMovieRecommendations(int movieId) async {
    final result = await _baseMovieDetailsRemoteDataSource
        .getCurrentMovieRecommendations(movieId);
    return _movieRecommendationsOrFailure(result);
  }

  Either<Failure, MovieDetails> _movieDetailsOrFailure(MovieDetails result) {
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.serverErrorMessage.statusMessage),
      );
    }
  }

  Either<Failure, List<MovieRecommendations>> _movieRecommendationsOrFailure(
      List<MovieRecommendationsModel> result) {
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.serverErrorMessage.statusMessage),
      );
    }
  }
}
