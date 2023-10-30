part of 'post_details_bloc.dart';

abstract class PostDetailsState extends Equatable {
  const PostDetailsState();
}

class PostDetailsInitial extends PostDetailsState {
  @override
  List<Object> get props => [];
}

class PostDetailsLoadedState extends PostDetailsState{
  PostDetailsModel? postDetailsModel;

  PostDetailsLoadedState({this.postDetailsModel});

  @override

  List<Object?> get props => [postDetailsModel];
}


class PostDetailsErrorState extends PostDetailsState{
  String? erMsg;

  PostDetailsErrorState({this.erMsg});

  @override

  List<Object?> get props => [erMsg];

}
