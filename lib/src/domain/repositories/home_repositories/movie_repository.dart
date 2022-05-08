import 'package:movies/src/infra/models/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getMostPopularMovies();
}
