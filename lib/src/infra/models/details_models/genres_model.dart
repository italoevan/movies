import 'package:movies/src/domain/entities/details_entities/genres_entity.dart';

class GenresModel extends GenresEntity {
  GenresModel(int id, String name) : super(id, name);

  factory GenresModel.fromMap(Map<String, dynamic> map) {
    return GenresModel(map["id"], map["name"]);
  }
}
