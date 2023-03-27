import 'package:equatable/equatable.dart';

class MovieRecommendations extends Equatable {
  final int movieId;
  final String? backdropPath;

  const MovieRecommendations({
    required this.movieId,
    required this.backdropPath,
  });

  @override
  List<Object?> get props => [
        movieId,
        backdropPath,
      ];
}
