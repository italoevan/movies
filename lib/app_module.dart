import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/src/core/routes/app_routes.dart';
import 'package:movies/src/core/utils/requester.dart';
import 'package:movies/src/external/datasources/movie_datasource/get_most_popular_movies_datasource_impl.dart';
import 'package:movies/src/external/datasources/movie_datasource/get_now_playing_datasource_impl.dart';
import 'package:movies/src/infra/repositories/movie_repositories/movie_repository_impl.dart';
import 'package:movies/src/presenter/details/details_page.dart';
import 'package:movies/src/presenter/home/home_controller.dart';
import 'package:movies/src/presenter/home/home_page.dart';

import 'src/domain/usecases/home_usecases/get_most_popular_movies_usecase.dart';
import 'src/domain/usecases/home_usecases/get_now_playing_usecase.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => RequesterImpl()),
        Bind((i) => GetNowPlayingDatasourceImpl(Modular.get())),
        Bind((i) => GetMostPopularMoviesDatasourceImpl(Modular.get())),
        Bind((i) => MovieRepositoryImpl(Modular.get(), Modular.get())),
        Bind<GetNowPlayingUsecase>(
            (i) => GetNowPlayingUsecaseImpl(Modular.get())),
        Bind((i) => GetMostPopularMoviesUsecaseImpl(Modular.get())),
        Bind<HomeController>(
            (i) => HomeControllerImpl(Modular.get(), Modular.get()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, arg) => HomePage(Modular.get())),
        ChildRoute(AppRoutes.details, child: (context, arg) => DetailsPage())
      ];
}
