part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}


class PostLoadedEvent extends HomeEvent{
  HomeModel? homeModel;


  PostLoadedEvent({this.homeModel});

  @override

  List<Object?> get props => [
    homeModel
  ];

}