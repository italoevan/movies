import 'package:movies/src/infra/models/now_playing_movie_model.dart';

abstract class MovieRepository {
  Future<List<NowPlayingMovieModel>> getNowPlayingUsecase();
}


