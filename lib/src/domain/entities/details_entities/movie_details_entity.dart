import 'package:movies/src/domain/entities/details_entities/genres_entity.dart';

class MovieDetailsEntity {
  final String image;
  final double voteAverage;
  final int id;
  final List<GenresEntity> genres;
  final String overview;

  MovieDetailsEntity({
    required this.image,
    required this.voteAverage,
    required this.id,
    required this.genres,
    required this.overview,
  });
}
