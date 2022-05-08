abstract class DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsLoadedState extends DetailsState {}

class DetailsErrorState extends DetailsState {
  String? errorMessage;
  DetailsErrorState({this.errorMessage});
}
