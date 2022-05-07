import 'package:movies/src/core/consts/endpoints/app_endpoints.dart';
import 'package:movies/src/core/utils/requester.dart';

import '../../../infra/datasources/get_most_popular_movies_datasource.dart';

class GetMostPopularMoviesDatasourceImpl
    implements GetMostPopularMoviesDatasource {
  final Requester requester;

  GetMostPopularMoviesDatasourceImpl(this.requester);

  @override
  Future getMostPopularMoviesDatasource() async {
    
    var response =
        await requester.fetch(url: AppEndpoints.mostPopularsMoviesEndpoint);
    return response;
  }
}
