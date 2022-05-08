import 'package:movies/src/domain/repositories/details_repositories/details_repository.dart';
import 'package:movies/src/infra/models/details_models/details_model.dart';

abstract class GetDetailsUsecase {
  Future<DetailsModel> getDetails(String movieId);
}

class GetDetailsUsecaseImpl implements GetDetailsUsecase {
  final DetailsRepository repository;

  GetDetailsUsecaseImpl(this.repository);

  @override
  Future<DetailsModel> getDetails(String movieId) async {
    var response = await repository.getDetails(movieId);
    return response;
  }
}
