import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_clean_architecture/core/utils/request_state.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_now_playing_use_case.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_popular_use_case.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_top_rated_use_case.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(MoviesInitialState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      MoviesEvent event, Emitter<MoviesState> emit) async {
    // Callable Class
    final result = await getNowPlayingUseCase();
    result.fold(
      (l) => emit(
        NowPlayingMoviesState(
          nowPlayingRequestState: RequestState.error,
          nowPlayingErrorMessage: l.message,
        ),
      ),
      (r) => emit(
        NowPlayingMoviesState(
          nowPlayingMovies: r,
          nowPlayingRequestState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase();
    result.fold(
      (l) => emit(
        PopularMoviesState(
          popularMoviesRequestState: RequestState.error,
          popularMoviesErrorMessage: l.message,
        ),
      ),
      (r) => emit(
        PopularMoviesState(
          popularMovies: r,
          popularMoviesRequestState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      MoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase();
    result.fold(
      (l) => emit(
        TopRatedMoviesState(
          topRatedErrorMessage: l.message,
          topRatedRequestState: RequestState.error,
        ),
      ),
      (r) => emit(
        TopRatedMoviesState(
          topRatedMovies: r,
          topRatedRequestState: RequestState.loaded,
        ),
      ),
    );
  }
}
