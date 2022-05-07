import 'package:movies/src/domain/entities/movie.dart';

class MovieModel extends MovieEntity {
  MovieModel(String image, int id, String title) : super(image, id, title);

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(map["poster_path"], map["id"], map["original_title"]);
  }
}
