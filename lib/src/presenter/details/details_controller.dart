import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/src/domain/entities/movie_entity.dart';
import 'package:movies/src/domain/usecases/details_usecases/get_details_usecase.dart';

abstract class DetailsController {
  Future getDetails();
}

class DetailsControllerImpl implements DetailsController {
  final GetDetailsUsecase getDetailsUsecase;

  DetailsControllerImpl(this.getDetailsUsecase);

  @override
  Future getDetails() async {
    var response = await getDetailsUsecase
        .getDetails((Modular.args.data as MovieEntity).id.toString());
    print(response);
  }
}
