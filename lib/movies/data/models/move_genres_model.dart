import 'package:movies_clean_architecture/movies/domain/entities/movies_genres.dart';

class MovieGenresModel extends MovieGenres {
  const MovieGenresModel({
    required super.genreId,
    required super.genreName,
  });
  
  factory MovieGenresModel.fromJson(Map<String, dynamic> json) =>
      MovieGenresModel(
        genreId: json['id'],
        genreName: json['name'],
      );
}
