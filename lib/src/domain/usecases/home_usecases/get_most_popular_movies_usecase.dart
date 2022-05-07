import 'package:movies/src/domain/entities/movie.dart';
import 'package:movies/src/domain/repositories/movie_repositories/movie_repository.dart';
import 'package:movies/src/infra/models/movie_model.dart';

abstract class GetMostPopularMoviesUsecase {
  Future<List<MovieModel>> getMostPopularMovies();
}

class GetMostPopularMoviesUsecaseImpl implements GetMostPopularMoviesUsecase {
  final MovieRepository repository;

  GetMostPopularMoviesUsecaseImpl(this.repository);

  @override
  Future<List<MovieModel>> getMostPopularMovies() async {
    var response = await repository.getMostPopularMovies();
    return response;
  }
}
