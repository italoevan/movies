import 'package:movies/src/domain/entities/movie.dart';

class NowPlayingMovieModel extends MovieEntity {
  NowPlayingMovieModel(String image, int id) : super(image, id);

  factory NowPlayingMovieModel.fromMap(Map<String, dynamic> map) {
    return NowPlayingMovieModel(map["poster_path"], map["id"]);
  }
}
