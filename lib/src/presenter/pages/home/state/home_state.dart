abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState{}

class HomeErrorState extends HomeState {

  String? errorMessage;
  HomeErrorState({this.errorMessage});
}
