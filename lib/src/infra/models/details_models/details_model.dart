import 'package:movies/src/domain/entities/details_entities/genres_entity.dart';
import 'package:movies/src/domain/entities/details_entities/movie_details_entity.dart';
import 'package:movies/src/infra/models/details_models/genres_model.dart';

class DetailsModel extends MovieDetailsEntity {
  DetailsModel(
      {required String image,
      required double voteAverage,
      required int id,
      required List<GenresEntity> genres,
      required String overview})
      : super(
            image: image,
            voteAverage: voteAverage,
            id: id,
            genres: genres,
            overview: overview);

  factory DetailsModel.fromMap(Map<String, dynamic> map) {
    return DetailsModel(
        image: map["backdrop_path"],
        voteAverage: map["vote_average"],
        id: map["id"],
        genres: map["genres"].map((v) => GenresModel.fromMap(v)).toList(),
        overview: map["overview"]);
  }
}
