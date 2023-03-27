import 'package:dio/dio.dart';
import 'package:movies_clean_architecture/core/errors/exceptions.dart';
import 'package:movies_clean_architecture/core/network/api_constants.dart';
import 'package:movies_clean_architecture/movies/data/models/error_message_model.dart';
import 'package:movies_clean_architecture/movies/data/models/movie_details_model.dart';
import 'package:movies_clean_architecture/movies/data/models/movie_recommendations_model.dart';

abstract class BaseMovieDetailsRemoteDataSource {
  Future<MovieDetailsModel> getCurrentMovieDetails(int movieId);
  Future<List<MovieRecommendationsModel>> getCurrentMovieRecommendations(
      int movieId);
}

class MovieDetailsRemoteDataSourceImpl
    extends BaseMovieDetailsRemoteDataSource {
  @override
  Future<MovieDetailsModel> getCurrentMovieDetails(int movieId) async {
    final response = await Dio().get(ApiConstants.movieDetailsPath(movieId));
    return _movieDetailsOrFailure(response);
  }

  @override
  Future<List<MovieRecommendationsModel>> getCurrentMovieRecommendations(
      int movieId) async {
    final response =
        await Dio().get(ApiConstants.movieRecommendationsPath(movieId));
    return _movieRecommendationsOrFailure(response);
  }

  MovieDetailsModel _movieDetailsOrFailure(Response<dynamic> response) {
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        serverErrorMessage: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  List<MovieRecommendationsModel> _movieRecommendationsOrFailure(
      Response<dynamic> response) {
    if (response.statusCode == 200) {
      return List<MovieRecommendationsModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieRecommendationsModel.fromjson(e),
        ),
      );
    } else {
      throw ServerException(
        serverErrorMessage: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
