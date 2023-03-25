// ignore_for_file: constant_identifier_names

class ApiConstants {
  static const String MOVIES_BASE_URL = 'https://api.themoviedb.org/3';
  static const String API_KEY = 'c3435cfe40aeb079689227d82bf921d3';
  static const String BASE_IMAGE_URL = 'https://image.tmdb.org/t/p/w500';

  static const String NOW_PLAYING_MOVIES =
      '$MOVIES_BASE_URL/movie/now_playing?api_key=$API_KEY';
  static const String POPULAR_MOVIES =
      '$MOVIES_BASE_URL/movie/popular?api_key=$API_KEY';
  static const String TOP_RATED_MOVIES =
      '$MOVIES_BASE_URL/movie/top_rated?api_key=$API_KEY';

  static String imageUrl(String path) => '$BASE_IMAGE_URL/$path';
}
