
import '../../../infra/models/details_models/details_model.dart';

abstract class DetailsRepository {
  Future<DetailsModel> getDetails(String movieId);
}
