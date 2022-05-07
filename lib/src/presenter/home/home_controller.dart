import 'package:get/get.dart';
import 'package:movies/src/domain/usecases/home_usecases/get_most_popular_movies_usecase.dart';
import 'package:movies/src/presenter/home/state/home_state.dart';

import '../../domain/usecases/home_usecases/get_now_playing_usecase.dart';
import '../../infra/models/movie_model.dart';

abstract class HomeController {
  HomeState get currentState;
  Future getMovies();
  List<MovieModel> get playingNowMovies;
  List<MovieModel> get mostPopularMovies;
}

class HomeControllerImpl extends HomeController {
  @override
  List<MovieModel> playingNowMovies = [];

  @override
  List<MovieModel> mostPopularMovies = [];

  // ignore: prefer_final_fields
  Rx<HomeState> _currentState = Rx(HomeLoadingState());

  @override
  HomeState get currentState => _currentState.value;

  setCurrentState(HomeState state) => _currentState.value = state;

  final GetNowPlayingUsecase getNowPlayingUsecase;
  final GetMostPopularMoviesUsecase getMostPopularMoviesUsecase;

  HomeControllerImpl(
    this.getNowPlayingUsecase,
    this.getMostPopularMoviesUsecase,
  );

  Future getNowPlayingMovies() async {
    var response = await getNowPlayingUsecase.getMovieNowPlayingUsecase();
    playingNowMovies = response;
    return response;
  }

  Future getMostPopularMovies() async {
    var response = await getMostPopularMoviesUsecase.getMostPopularMovies();
    mostPopularMovies = response;
    return response;
  }

  @override
  Future getMovies() async {
    await getMostPopularMovies();
    await getNowPlayingMovies();

    setCurrentState(HomeLoadedState());
  }
}
