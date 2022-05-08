import 'dart:convert';

import 'package:movies/src/domain/repositories/details_repositories/details_repository.dart';
import 'package:movies/src/infra/datasources/details_datasources/get_details_datasource.dart';

import '../../models/details_models/details_model.dart';

class DetailsRepositoryImpl implements DetailsRepository {
  final GetDetailsDatasource datasource;

  DetailsRepositoryImpl(this.datasource);

  @override
  Future<DetailsModel> getDetails(String movieId) async {
    var response = await datasource.getDetails(movieId);

    var jsonResponse = jsonDecode(response.body);

    var model = DetailsModel.fromMap(jsonResponse);

    return model;
  }
}
