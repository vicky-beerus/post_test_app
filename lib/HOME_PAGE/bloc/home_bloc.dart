import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_projects/HOME_PAGE/model/home_model.dart';

import '../repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
on(_onGetPosts);
  }

  _onGetPosts(PostLoadedEvent event, Emitter<HomeState> emi)async{
    try{
      List<HomeModel> homeModel = await homeRepository.getPosts();
      emit(HomeLoadedState(homeModel: homeModel));
    }catch(e){
      emit(HomeErrorState(erMsg: e.toString()
      ));
    };


  }
}
