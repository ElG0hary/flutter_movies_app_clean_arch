import 'package:movies_clean_architecture/core/errors/exceptions.dart';
import 'package:movies_clean_architecture/movies/data/datasources/movies_remote_data_source.dart';
import 'package:movies_clean_architecture/movies/data/models/movie_model.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movies_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/movies/domain/repositories/base_movie_repository.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource remoteDataSource;

  MoviesRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final moviesResult = await remoteDataSource.getNowPlayingMovies();
    return _moviesOrFailure(moviesResult);
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final moviesResult = await remoteDataSource.getPopularMovies();
    return _moviesOrFailure(moviesResult);
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final moviesResult = await remoteDataSource.getTopRatedMovies();
    return _moviesOrFailure(moviesResult);
  }

  Either<Failure, List<Movie>> _moviesOrFailure(
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
