import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/core/network/api_error_model.dart';
import 'package:posts_app/core/strings/message.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/domain/usecases/add_post_usecase.dart';
import 'package:posts_app/features/posts/domain/usecases/delete_post_usecase.dart';
import 'package:posts_app/features/posts/domain/usecases/update_post_usecase.dart';

part 'add_delete_update_post_event.dart';
part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc
    extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  final AddPostUsecase addPostUsecase;
  final UpdatePostUsecase updatePostUsecase;
  final DeletePostUsecase deletePostUsecase;
  AddDeleteUpdatePostBloc({
    required this.addPostUsecase,
    required this.updatePostUsecase,
    required this.deletePostUsecase,
  }) : super(AddDeleteUpdatePostInitial()) {
    on<AddDeleteUpdatePostEvent>((event, emit) async {
      emit(LoadingAddDeleteUpdatePostState());
      if (event is AddPostEvent) {
        final result = await addPostUsecase(event.post);
        _stateHandle(result, postWasAdded);
      } else if (event is UpdatePostEvent) {
        final result = await updatePostUsecase(event.updatePost);
        _stateHandle(result, postWasUpdated);
      } else if (event is DeletePostEvent) {
        final result = await deletePostUsecase(event.postId);
        _stateHandle(result, postWasDeleted);
      }
    });
  }
  AddDeleteUpdatePostState _stateHandle(
      Either<ApiErrorModel, void> result, String message) {
    return result.fold(
      (error) => ErrorAddDeleteUpdatePostState(error.message),
      (data) => MessageAddDeleteUpdatePostState(message),
    );
  }
}
