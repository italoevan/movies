import 'package:movies/src/domain/entities/movie.dart';
import 'package:movies/src/infra/models/generic_movie_model.dart';

class NowPlayingMovieModel extends NowPlayingMovie implements GenericMovieModel{
  NowPlayingMovieModel(String image, int id) : super(image, id);

  factory NowPlayingMovieModel.fromMap(Map<String, dynamic> map) {
    return NowPlayingMovieModel(map["poster_path"], map["id"]);
  }
}
