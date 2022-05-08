import 'package:movies/src/domain/repositories/details_repositories/details_repository.dart';

abstract class GetDetailsUsecase {
  Future getDetails(String movieId);
}

class GetDetailsUsecaseImpl implements GetDetailsUsecase {
  final DetailsRepository repository;

  GetDetailsUsecaseImpl(this.repository);

  @override
  Future getDetails(String movieId) async {
    var response = await repository.getDetails(movieId);
    return response;
  }
}
