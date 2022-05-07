import 'package:get/get.dart';
import 'package:movies/src/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies/src/presenter/home/state/home_state.dart';

import '../../infra/models/now_playing_movie_model.dart';

abstract class HomeController {
  HomeState get currentState;
  Future getNowPlayingMovies();
  List<NowPlayingMovieModel> get movies;
}

class HomeControllerImpl extends HomeController {
  @override
  List<NowPlayingMovieModel> movies = [];

  // ignore: prefer_final_fields
  Rx<HomeState> _currentState = Rx(HomeLoadingState());

  @override
  HomeState get currentState => _currentState.value;

  setCurrentState(HomeState state) => _currentState.value = state;

  final GetNowPlayingUsecase getNowPlayingUsecase;

  HomeControllerImpl(this.getNowPlayingUsecase);

  @override
  Future getNowPlayingMovies() async {
    var response = await getNowPlayingUsecase.getMovieNowPlayingUsecase();
    setCurrentState(HomeLoadedState());
    movies = response;
    return response;
  }
}
