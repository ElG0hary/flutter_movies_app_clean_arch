import 'package:dio/dio.dart';
import 'package:movies_clean_architecture/core/errors/exceptions.dart';
import 'package:movies_clean_architecture/core/network/api_constants.dart';
import 'package:movies_clean_architecture/movies/data/models/error_message_model.dart';
import 'package:movies_clean_architecture/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSourceImpl extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.GET_NOW_PLAYING_URL);
    return _dataOrException(response);
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.GET_POPULAR_MOVIES_URL);
    return _dataOrException(response);
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.GET_TOP_RATED_URL);
    return _dataOrException(response);
  }

  List<MovieModel> _dataOrException(Response<dynamic> response) {
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (jsonMovieList) => MovieModel.fromJson(jsonMovieList),
        ),
      );
    } else {
      throw ServerException(
        serverErrorMessage: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
