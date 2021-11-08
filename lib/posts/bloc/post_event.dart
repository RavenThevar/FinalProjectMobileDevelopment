part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFetched extends PostEvent {}

class FetchPosts extends PostEvent {
  bool isFetching = false;

  FetchPosts(bool bool);
}

class LogIn extends PostEvent {
  LogIn(this.author);

  String author;
}

// class  extends
