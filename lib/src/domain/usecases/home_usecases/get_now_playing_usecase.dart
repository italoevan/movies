import 'package:movies/src/infra/models/movie_model.dart';

import '../../repositories/home_repositories/movie_repository.dart';

abstract class GetNowPlayingUsecase {
  Future<List<MovieModel>> getMovieNowPlayingUsecase();
}

class GetNowPlayingUsecaseImpl implements GetNowPlayingUsecase {
  final MovieRepository movieRepository;

  GetNowPlayingUsecaseImpl(this.movieRepository);

  @override
  Future<List<MovieModel>> getMovieNowPlayingUsecase() async {
    var response = await movieRepository.getNowPlaying();

    return response;
  }
}
