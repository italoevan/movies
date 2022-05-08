import '../keys/api_keys.dart';

abstract class AppEndpoints {
  static const String nowPlayingeEndpoint =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey";

  static const String mostPopularsMoviesEndpoint =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";

  static String imageEndpoint(String imageUrl) =>
      "https://image.tmdb.org/t/p/w500/$imageUrl";

  static String detailsEndpoint (String movieId)=>
      "https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&language=EN";
}
