import 'package:posts_app/core/network/api_result.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';

abstract class PostRepo {
  Future<ApiResult<List<Post>>> getAllPosts();
  Future<ApiResult<void>> addPost(Post post);
  Future<ApiResult<void>> removePost(int postId);
  Future<ApiResult<void>> updatePost(Post updatePost);
}
