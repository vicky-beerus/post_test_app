import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_projects/POST_DETAILS/model/post_detail_model.dart';

import '../repo/post_detail_repo.dart';

part 'post_details_event.dart';
part 'post_details_state.dart';

class PostDetailsBloc extends Bloc<PostDetailsEvent, PostDetailsState> {
  ProductDetailsRepository productDetailsRepository;
  PostDetailsBloc({required this.productDetailsRepository}) : super(PostDetailsInitial()) {
   on(_onDetailsGet);
  }

  _onDetailsGet(PostClickEvent event , Emitter<PostDetailsState>emit)async{
    try{
      PostDetailsModel postDetailsModel = await productDetailsRepository.getPostDetails(id: event.id);
      emit(PostDetailsLoadedState(postDetailsModel: postDetailsModel));
    }catch(e){
      emit(PostDetailsErrorState(erMsg: e.toString()));
    }
  }
}
