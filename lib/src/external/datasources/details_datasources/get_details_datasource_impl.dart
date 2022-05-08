import 'package:movies/src/core/consts/endpoints/app_endpoints.dart';
import 'package:movies/src/core/utils/requester.dart';
import 'package:movies/src/infra/datasources/details_datasources/get_details_datasource.dart';

class GetDetailsDatasourceImpl implements GetDetailsDatasource {
  final Requester requester;

  GetDetailsDatasourceImpl(this.requester);

  @override
  Future getDetails(String movieId) async {
    var response = await requester.fetch(url: AppEndpoints.detailsEndpoint(movieId));
    return response;
  }
}
