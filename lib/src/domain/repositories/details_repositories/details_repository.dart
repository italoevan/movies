

import '../../entities/details_entities/movie_details_entity.dart';

abstract class DetailsRepository {
  Future<MovieDetailsEntity> getDetails(String movieId);
}
