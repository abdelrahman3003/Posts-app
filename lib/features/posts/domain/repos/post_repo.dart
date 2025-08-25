import 'package:dartz/dartz.dart';
import 'package:posts_app/core/network/api_error_model.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';

abstract class PostRepo {
  Future<Either<ApiErrorModel, List<Post>>> getAllPosts();
  Future<Either<ApiErrorModel, void>> addPost(Post post);
  Future<Either<ApiErrorModel, void>> removePost(int postId);
  Future<Either<ApiErrorModel, void>> updatePost(Post updatePost);
}
