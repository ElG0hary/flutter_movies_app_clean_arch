part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
  
  @override
  List<Object?> get props => [];
}

class MoviesInitialState extends MoviesState {
  @override
  List<Object?> get props => [];
}

class NowPlayingMoviesState extends MoviesState {
  final List<Movie> nowPlayingMovies;
  final String nowPlayingErrorMessage;
  final RequestState nowPlayingRequestState;

  const NowPlayingMoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingErrorMessage = '',
    this.nowPlayingRequestState = RequestState.loading,
  });
  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingErrorMessage,
        nowPlayingRequestState,
      ];
}

class PopularMoviesState extends MoviesState {
  final List<Movie> popularMovies;
  final String popularMoviesErrorMessage;
  final RequestState popularMoviesRequestState;

  const PopularMoviesState({
    this.popularMovies = const [],
    this.popularMoviesErrorMessage = '',
    this.popularMoviesRequestState = RequestState.loading,
  });
  @override
  List<Object?> get props => [
        popularMovies,
        popularMoviesErrorMessage,
        popularMoviesRequestState,
      ];
}

class TopRatedMoviesState extends MoviesState {
  final List<Movie> topRatedMovies;
  final String topRatedErrorMessage;
  final RequestState topRatedRequestState;

  const TopRatedMoviesState({
    this.topRatedMovies = const [],
    this.topRatedErrorMessage = '',
    this.topRatedRequestState = RequestState.loading,
  });

  @override
  List<Object?> get props => [
        topRatedMovies,
        topRatedErrorMessage,
        topRatedRequestState,
      ];
}
