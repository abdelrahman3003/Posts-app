part of 'posts_bloc.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}

final class LoadingPostsState extends PostsState {}

final class LoadedPostsState extends PostsState {
  final List<Post> postsList;
  @override
  List<Object> get props => [postsList];
  const LoadedPostsState(this.postsList);
}

final class ErrorPostsState extends PostsState {
  final String message;
  @override
  List<Object> get props => [message];
  const ErrorPostsState(this.message);
}
