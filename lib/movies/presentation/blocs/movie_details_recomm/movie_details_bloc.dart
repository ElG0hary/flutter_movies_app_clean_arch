import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_clean_architecture/core/utils/request_state.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_details.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_recommendations.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_current_recommendations.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_movie_details.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetCurrentMovieRecommendationsUseCase getCurrentMovieRecommendations;
  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getCurrentMovieRecommendations,
  ) : super(const MovieDetailsState()) {
    on<GetCurrentMovieDetailsEvent>(_getCurrentMovieDetails);
    on<GetCurrentMovieRecommendationsEvent>(_getCurrentMovieRecommendations);
  }

  FutureOr<void> _getCurrentMovieDetails(GetCurrentMovieDetailsEvent event,
      Emitter<MovieDetailsState> emit) async {
    final results = await getMovieDetailsUseCase(event.movieId);
    results.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsRequestState: RequestState.error,
          movieDetailsErrorMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsRequestState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getCurrentMovieRecommendations(
      GetCurrentMovieRecommendationsEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getCurrentMovieRecommendations(event.movieId);
    result.fold(
      (l) => emit(
        state.copyWith(
          movieRecommendationsErrorMessage: l.message,
          movieRecommendationsRequestState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieRecommendations: r,
          movieRecommendationsRequestState: RequestState.loaded,
        ),
      ),
    );
  }
}
