import 'package:movies_clean_architecture/core/errors/exceptions.dart';
import 'package:movies_clean_architecture/movies/data/datasources/movies_main_screen_remote_data_source.dart';
import 'package:movies_clean_architecture/movies/data/models/movie_model.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movies_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/movies/domain/repositories/base_main_screen.dart';

class MoviesRepository extends BaseMainScreenMoviesRepository {
  final BaseMovieRemoteDataSource _remoteDataSource;

  MoviesRepository(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final moviesResult = await _remoteDataSource.getNowPlayingMovies();
    return _moviesOrFailure(moviesResult);
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final moviesResult = await _remoteDataSource.getPopularMovies();
    return _moviesOrFailure(moviesResult);
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final moviesResult = await _remoteDataSource.getTopRatedMovies();
    return _moviesOrFailure(moviesResult);
  }

  Either<Failure, List<Movie>>  _moviesOrFailure(
    List<MovieModel> moviesResult,
  ) {
    try {
      return Right(moviesResult);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.serverErrorMessage.statusMessage),
      );
    }
  }
}
