import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:movies/src/domain/entities/movie_entity.dart';
import 'package:movies/src/domain/usecases/details_usecases/get_details_usecase.dart';
import 'package:movies/src/infra/models/details_models/details_model.dart';
import 'package:movies/src/presenter/pages/details/state/details_state.dart';

abstract class DetailsController {
  DetailsState get currentState;
  Future getDetails();
  DetailsModel get model;
}

class DetailsControllerImpl implements DetailsController {
  final GetDetailsUsecase getDetailsUsecase;

  DetailsControllerImpl(this.getDetailsUsecase);

  // ignore: prefer_final_fields
  Rx<DetailsState> _currentState = Rx(DetailsLoadedState());

  late DetailsModel _detailsModel;

  @override
  Future getDetails() async {
    setCurrentState(DetailsLoadingState());
    var response = await getDetailsUsecase
        .getDetails((Modular.args.data as MovieEntity).id.toString());
    _detailsModel = response;
    setCurrentState(DetailsLoadedState());
  }

  @override
  DetailsState get currentState => _currentState.value;

  void setCurrentState(DetailsState state) => _currentState.value = state;

  @override
  DetailsModel get model => _detailsModel;
}
