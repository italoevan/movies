import 'dart:convert';

import 'package:movies/src/infra/models/movie_model.dart';

import '../../../domain/repositories/home_repositories/movie_repository.dart';
import '../../datasources/home_datasources/get_most_popular_movies_datasource.dart';
import '../../datasources/home_datasources/get_now_playing_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final GetNowPlayingDatasource datasource;
  final GetMostPopularMoviesDatasource getMostPopularMoviesDatasource;

  MovieRepositoryImpl(
    this.datasource,
    this.getMostPopularMoviesDatasource,
  );

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    late List<MovieModel> movies = [];

    var response = await datasource.getNowPlayingUsecase();

    var jsonResponse = jsonDecode(response.body);

    jsonResponse["results"].forEach((v) {
      movies.add(MovieModel.fromMap(v));
    });

    return movies;
  }

  @override
  Future<List<MovieModel>> getMostPopularMovies() async {
    late List<MovieModel> movies = [];

    var response =
        await getMostPopularMoviesDatasource.getMostPopularMoviesDatasource();

    var jsonResponse = jsonDecode(response.body);

    jsonResponse["results"].forEach((v) {
      movies.add(MovieModel.fromMap(v));
    });

    return movies;
  }
}
