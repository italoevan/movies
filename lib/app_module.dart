import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/src/core/routes/app_routes.dart';
import 'package:movies/src/core/utils/requester.dart';
import 'package:movies/src/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies/src/external/datasources/movie_datasource/get_now_playing_datasource_impl.dart';
import 'package:movies/src/infra/repositories/movie_repositories/movie_repository_impl.dart';
import 'package:movies/src/presenter/home/home_controller.dart';
import 'package:movies/src/presenter/home/home_page.dart';

class AppModule extends Module {

  @override
  List<Bind<Object>> get binds => [
    Bind.singleton((i)=> RequesterImpl()),
    Bind((i)=>GetNowPlayingDatasourceImpl(Modular.get())),
    Bind((i)=> MovieRepositoryImpl(Modular.get())),
    Bind<GetNowPlayingUsecase>((i)=> GetNowPlayingUsecaseImpl(Modular.get())),
    Bind<HomeController>((i)=> HomeControllerImpl(Modular.get()))
  ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute(Modular.initialRoute, child: (context, arg) =>  HomePage(Modular.get()))];
}
