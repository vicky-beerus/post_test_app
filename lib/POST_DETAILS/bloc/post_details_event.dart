part of 'post_details_bloc.dart';

abstract class PostDetailsEvent extends Equatable {
  const PostDetailsEvent();
}


class PostClickEvent extends PostDetailsEvent{
  String? id;

  PostClickEvent({this.id});

  @override

  List<Object?> get props => [id];
}