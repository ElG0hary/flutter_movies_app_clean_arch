// ignore_for_file: constant_identifier_names

class ApiConstants {
  static const String MOVIES_BASE_URL = 'https://api.themoviedb.org/3';
  static const String API_KEY = '[Your Api Here]';
  static const String BASE_IMAGE_URL = 'https://image.tmdb.org/t/p/w500';

  static const String GET_NOW_PLAYING_URL =
      '$MOVIES_BASE_URL/movie/now_playing?api_key=$API_KEY';

  static const String GET_POPULAR_MOVIES_URL =
      '$MOVIES_BASE_URL/movie/popular?api_key=$API_KEY';

  static const String GET_TOP_RATED_URL =
      '$MOVIES_BASE_URL/movie/top_rated?api_key=$API_KEY';

  static String imageUrl(String path) => '$BASE_IMAGE_URL/$path';

  static String movieDetailsPath(int movieId) =>
      '$MOVIES_BASE_URL/movie/$movieId?api_key=$API_KEY';

  static String movieRecommendationsPath(int movieId) =>
      '$MOVIES_BASE_URL/movie/$movieId/recommendations?api_key=$API_KEY';

  static String searchForMovie(String movieName) =>
      '$MOVIES_BASE_URL/search/movie?api_key=$API_KEY&query=$movieName';
}
