part of 'add_delete_update_post_bloc.dart';

sealed class AddDeleteUpdatePostEvent extends Equatable {
  const AddDeleteUpdatePostEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends AddDeleteUpdatePostEvent {
  final Post post;

  const AddPostEvent(this.post);
  @override
  List<Object> get props => [post];
}

class DeletePostEvent extends AddDeleteUpdatePostEvent {
  final int postId;

  const DeletePostEvent(this.postId);
  @override
  List<Object> get props => [postId];
}

class UpdatePostEvent extends AddDeleteUpdatePostEvent {
  final Post updatePost;

  const UpdatePostEvent(this.updatePost);
  @override
  List<Object> get props => [updatePost];
}
