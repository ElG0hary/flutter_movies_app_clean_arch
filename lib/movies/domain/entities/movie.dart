import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title, overview, backdropPath, releaseDate;
  final double voteAverage;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        backdropPath,
        releaseDate,
        voteAverage,
      ];
}
