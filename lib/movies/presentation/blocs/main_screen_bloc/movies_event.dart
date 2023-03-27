part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvent {}

class GetPopularMoviesEvent extends MoviesEvent {}

class GetTopRatedMoviesEvent extends MoviesEvent {}

class SearchForMovieEvent extends MoviesEvent {
  final String movieName;

  const SearchForMovieEvent(this.movieName);
}
