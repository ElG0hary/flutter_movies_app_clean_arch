part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  //Current Movie Details
  final MovieDetails? movieDetails;
  final RequestState movieDetailsRequestState;
  final String movieDetailsErrorMessage;

  //Current Movie Recommendations
  final List<MovieRecommendations>? movieRecommendations;
  final RequestState movieRecommendationsRequestState;
  final String movieRecommendationsErrorMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsRequestState = RequestState.loading,
    this.movieDetailsErrorMessage = '',
    this.movieRecommendations,
    this.movieRecommendationsRequestState = RequestState.loading,
    this.movieRecommendationsErrorMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsRequestState,
    String? movieDetailsErrorMessage,
    List<MovieRecommendations>? movieRecommendations,
    RequestState? movieRecommendationsRequestState,
    String? movieRecommendationsErrorMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsRequestState:
          movieDetailsRequestState ?? this.movieDetailsRequestState,
      movieDetailsErrorMessage:
          movieDetailsErrorMessage ?? this.movieDetailsErrorMessage,
      movieRecommendations: movieRecommendations ?? this.movieRecommendations,
      movieRecommendationsRequestState: movieRecommendationsRequestState ??
          this.movieRecommendationsRequestState,
      movieRecommendationsErrorMessage: movieRecommendationsErrorMessage ??
          this.movieRecommendationsErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsRequestState,
        movieDetailsErrorMessage,
        movieRecommendations,
        movieRecommendationsRequestState,
        movieRecommendationsErrorMessage
      ];
}
