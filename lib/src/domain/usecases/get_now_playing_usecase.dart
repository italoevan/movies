import 'package:movies/src/domain/repositories/movie_repositories/movie_repository.dart';
import 'package:movies/src/infra/models/now_playing_movie_model.dart';

abstract class GetNowPlayingUsecase {
  Future<List<NowPlayingMovieModel>> getMovieNowPlayingUsecase();
}

class GetNowPlayingUsecaseImpl implements GetNowPlayingUsecase {
  final MovieRepository movieRepository;

  GetNowPlayingUsecaseImpl(this.movieRepository);

  @override
  Future<List<NowPlayingMovieModel>> getMovieNowPlayingUsecase() async {

    var response = await movieRepository.getNowPlayingUsecase();

    return response;
  }
}
