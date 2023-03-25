import 'package:get_it/get_it.dart';
import 'package:movies_clean_architecture/movies/data/datasources/movies_remote_data_source.dart';
import 'package:movies_clean_architecture/movies/data/repository/movies_repository.dart';
import 'package:movies_clean_architecture/movies/domain/repositories/base_movie_repository.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_now_playing_use_case.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_popular_use_case.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_top_rated_use_case.dart';
import 'package:movies_clean_architecture/movies/presentation/blocs/movies_bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///! DataSource
    // Remote DataSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl());

    //! Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    //! UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    //! Movies Bloc
    sl.registerFactory(
      () => MoviesBloc(sl(), sl(), sl()),
    );
  }
}
