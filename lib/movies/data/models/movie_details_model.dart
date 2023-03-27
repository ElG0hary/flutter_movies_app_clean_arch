import 'package:movies_clean_architecture/movies/data/models/move_genres_model.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.runtime,
    required super.genres,
    required super.id,
    required super.title,
    required super.overview,
    required super.backdropPath,
    required super.releaseDate,
    required super.voteAverage,
  });
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        runtime: json['runtime'],
        genres: List<MovieGenresModel>.from(
          json['genres'].map(
            (x) => MovieGenresModel.fromJson(x),
          ),
        ),
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        backdropPath: json['backdrop_path'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'].toDouble(),
      );
}
