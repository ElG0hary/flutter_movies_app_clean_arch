import 'package:equatable/equatable.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movies_genres.dart';

class MovieDetails extends Equatable {
  final List<MovieGenres> genres;
  final int id, runtime;
  final String title, overview, backdropPath, releaseDate;
  final double voteAverage;

  const MovieDetails({
    required this.runtime,
    required this.genres,
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        genres,
        runtime,
        id,
        title,
        overview,
        backdropPath,
        releaseDate,
        voteAverage,
      ];
}
