import 'package:movies/src/domain/repositories/details_repositories/details_repository.dart';

import '../../entities/details_entities/movie_details_entity.dart';

abstract class GetDetailsUsecase {
  Future<MovieDetailsEntity> getDetails(String movieId);
}

class GetDetailsUsecaseImpl implements GetDetailsUsecase {
  final DetailsRepository repository;

  GetDetailsUsecaseImpl(this.repository);

  @override
  Future<MovieDetailsEntity> getDetails(String movieId) async {
    var response = await repository.getDetails(movieId);
    return response;
  }
}
