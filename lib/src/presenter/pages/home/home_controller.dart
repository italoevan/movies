import 'package:get/get.dart';
import 'package:movies/src/domain/entities/movie_entity.dart';
import 'package:movies/src/domain/usecases/home_usecases/get_most_popular_movies_usecase.dart';
import 'package:movies/src/presenter/pages/home/state/home_state.dart';

import '../../../domain/usecases/home_usecases/get_now_playing_usecase.dart';


abstract class HomeController {
  HomeState get currentState;
  Future getMovies();
  List<MovieEntity> get playingNowMovies;
  List<MovieEntity> get mostPopularMovies;
}

class HomeControllerImpl extends HomeController {
  @override
  List<MovieEntity> playingNowMovies = [];

  @override
  List<MovieEntity> mostPopularMovies = [];

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
