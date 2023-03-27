import 'package:movies_clean_architecture/movies/domain/entities/movie_recommendations.dart';

class MovieRecommendationsModel extends MovieRecommendations {
  const MovieRecommendationsModel({
    required super.movieId,
    required super.backdropPath,
  });
  factory MovieRecommendationsModel.fromjson(Map<String, dynamic> json) =>
      MovieRecommendationsModel(
        movieId: json['id'],
        backdropPath: json['backdrop_path'],
      );
}
