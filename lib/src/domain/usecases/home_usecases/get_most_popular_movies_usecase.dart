import 'package:movies/src/domain/entities/movie_entity.dart';

import '../../repositories/home_repositories/movie_repository.dart';

abstract class GetMostPopularMoviesUsecase {
  Future<List<MovieEntity>> getMostPopularMovies();
}

class GetMostPopularMoviesUsecaseImpl implements GetMostPopularMoviesUsecase {
  final MovieRepository repository;

  GetMostPopularMoviesUsecaseImpl(this.repository);

  @override
  Future<List<MovieEntity>> getMostPopularMovies() async {
    var response = await repository.getMostPopularMovies();
    return response;
  }
}
