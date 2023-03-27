part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetCurrentMovieDetailsEvent(this.movieId);
  @override
  List<Object> get props => [movieId];
}

class GetCurrentMovieRecommendationsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetCurrentMovieRecommendationsEvent(this.movieId);
  @override
  List<Object> get props => [movieId];
}
