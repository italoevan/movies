import 'dart:convert';

import 'package:movies/src/domain/repositories/movie_repositories/movie_repository.dart';
import 'package:movies/src/infra/datasources/get_now_playing_datasource.dart';
import 'package:movies/src/infra/models/now_playing_movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final GetNowPlayingDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<NowPlayingMovieModel>> getNowPlayingUsecase() async {
    late List<NowPlayingMovieModel> movies = [];

    var response = await datasource.getNowPlayingUsecase();

    var jsonResponse = jsonDecode(response.body);

    jsonResponse["results"].forEach((v) {
      movies.add(NowPlayingMovieModel.fromMap(v));
    });

    return movies;
  }
}
