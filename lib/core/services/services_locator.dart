import 'package:get_it/get_it.dart';
import 'package:movies_clean_architecture/movies/data/datasources/movie_details_remote_data_source.dart';
import 'package:movies_clean_architecture/movies/data/datasources/movies_main_screen_remote_data_source.dart';
import 'package:movies_clean_architecture/movies/data/repository/main_screen_movies_repository.dart';
import 'package:movies_clean_architecture/movies/data/repository/movie_details_repository.dart';
import 'package:movies_clean_architecture/movies/domain/repositories/base_main_screen.dart';
import 'package:movies_clean_architecture/movies/domain/repositories/base_movie_details_screen.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_current_recommendations.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/main_screen/get_now_playing_use_case.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/main_screen/get_popular_use_case.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/main_screen/get_top_rated_use_case.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/main_screen/search_movie_use_case.dart';
import 'package:movies_clean_architecture/movies/presentation/blocs/main_screen_bloc/movies_bloc.dart';
import 'package:movies_clean_architecture/movies/presentation/blocs/movie_details_recomm/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///! DataSource
    // Remote DataSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl());

    sl.registerLazySingleton<BaseMovieDetailsRemoteDataSource>(
        () => MovieDetailsRemoteDataSourceImpl());

    //! Repository
    sl.registerLazySingleton<BaseMainScreenMoviesRepository>(
        () => MoviesRepository(sl()));
    sl.registerLazySingleton<BaseMovieDetailsRepository>(
        () => MovieDetailsRepository(sl()));

    //! UseCases
    // MainScreen
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => SearchMovieUseCase(sl()));
    // Movie Details
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetCurrentMovieRecommendationsUseCase(sl()));

    //! Movies Bloc
    sl.registerFactory(
      () => MoviesBloc(sl(), sl(), sl(), sl()),
    );
    //! Movie Details
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
  }
}
