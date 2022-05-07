import 'package:movies/src/core/consts/endpoints/app_endpoints.dart';
import 'package:movies/src/core/utils/requester.dart';

import '../../../infra/datasources/get_now_playing_datasource.dart';

class GetNowPlayingDatasourceImpl implements GetNowPlayingDatasource {
  final Requester requester;

  GetNowPlayingDatasourceImpl(this.requester);

  @override
  Future getNowPlayingUsecase() async {
    var response = await requester.fetch(url: AppEndpoints.nowPlayingeEndpoint);
    return response;
  }
}
