import 'package:movies/src/domain/entities/movie_entity.dart';

import '../../repositories/home_repositories/movie_repository.dart';

abstract class GetNowPlayingUsecase {
  Future<List<MovieEntity>> getMovieNowPlayingUsecase();
}

class GetNowPlayingUsecaseImpl implements GetNowPlayingUsecase {
  final MovieRepository movieRepository;

  GetNowPlayingUsecaseImpl(this.movieRepository);

  @override
  Future<List<MovieEntity>> getMovieNowPlayingUsecase() async {
    var response = await movieRepository.getNowPlaying();

    return response;
  }
}
