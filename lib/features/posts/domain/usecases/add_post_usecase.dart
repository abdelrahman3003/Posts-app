import 'package:dartz/dartz.dart';
import 'package:posts_app/core/network/api_error_model.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/domain/repos/post_repo.dart';

class AddPostUsecase {
  final PostRepo postRepo;

  AddPostUsecase(this.postRepo);
  Future<Either<ApiErrorModel, void>> call(Post post) async {
    return await postRepo.addPost(post);
  }
}
