
import '../../entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getNowPlaying();
  Future<List<MovieEntity>> getMostPopularMovies();
}
