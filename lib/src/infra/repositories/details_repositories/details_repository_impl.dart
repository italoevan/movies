import 'package:movies/src/domain/repositories/details_repositories/details_repository.dart';
import 'package:movies/src/infra/datasources/details_datasources/get_details_datasource.dart';

class DetailsRepositoryImpl implements DetailsRepository {
  final GetDetailsDatasource datasource;

  DetailsRepositoryImpl(this.datasource);

  @override
  Future getDetails(String movieId) async {
    var response = await datasource.getDetails(movieId);
    return response;
  }
}
