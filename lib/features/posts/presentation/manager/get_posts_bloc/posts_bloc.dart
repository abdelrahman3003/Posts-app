import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/core/network/api_error_model.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/domain/usecases/get_all_posts_usecase.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUsecase getAllPostsUsecase;

  PostsBloc(this.getAllPostsUsecase) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      emit(LoadingPostsState());
      if (event is GetAllPostsEvent) {
        final result = await getAllPostsUsecase();

        emit(_stateHandle(result));
      } else if (event is RefreshPostsEvent) {
        final result = await getAllPostsUsecase();
        emit(_stateHandle(result));
      }
    });
  }

  PostsState _stateHandle(Either<ApiErrorModel, List<Post>> result) {
    return result.fold(
      (error) {
        log("------------${error.message}");
        return ErrorPostsState(error.message);
      },
      (data) => LoadedPostsState(data),
    );
  }
}
