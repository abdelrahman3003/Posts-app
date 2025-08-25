import 'package:dartz/dartz.dart';
import 'package:posts_app/core/network/api_error_handler.dart';
import 'package:posts_app/core/network/api_error_model.dart';
import 'package:posts_app/core/network/network_info.dart';
import 'package:posts_app/core/strings/failure.dart';
import 'package:posts_app/features/posts/data/data_source/local/posts_local_data_source.dart';
import 'package:posts_app/features/posts/data/data_source/remote/posts_remote_data_source.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/domain/repos/post_repo.dart';

class PostReposImpl implements PostRepo {
  final PostsRemoteDataSource postsRemoteDataSource;
  final PostsLocalDataSource postsLocalDataSource;
  final NetworkInfo networkInfo;
  PostReposImpl(
      this.postsRemoteDataSource, this.postsLocalDataSource, this.networkInfo);
  @override
  Future<Either<ApiErrorModel, List<Post>>> getAllPosts() async {
    if (await networkInfo.isDeviceConnected) {
      try {
        final result = await postsRemoteDataSource.getAllPosts();
        return right(result);
      } catch (error) {
        return left(ErrorHandler.handle(error));
      }
    } else {
      try {
        final result = await postsLocalDataSource.getCachedPosts();
        return right(result);
      } catch (error) {
        return left(ErrorHandler.handle(error));
      }
    }
  }

  @override
  Future<Either<ApiErrorModel, void>> addPost(Post post) async {
    return await _getMessage(() => postsRemoteDataSource.addPost(post));
  }

  @override
  Future<Either<ApiErrorModel, void>> removePost(int postId) async {
    return await _getMessage(() => postsRemoteDataSource.removePost(postId));
  }

  @override
  Future<Either<ApiErrorModel, void>> updatePost(Post updatePost) async {
    return await _getMessage(
        () => postsRemoteDataSource.updatePost(updatePost));
  }

  Future<Either<ApiErrorModel, void>> _getMessage(
      Future<void> Function() futdeleteOrUpdateOrAddPost) async {
    if (await networkInfo.isDeviceConnected) {
      try {
        futdeleteOrUpdateOrAddPost;
        return right(null);
      } catch (error) {
        return left(ErrorHandler.handle(error));
      }
    } else {
      return left(ErrorHandler.handle(enternetFailure));
    }
  }
}
