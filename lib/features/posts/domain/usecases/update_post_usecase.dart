import 'package:dartz/dartz.dart';
import 'package:posts_app/core/network/api_error_model.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/domain/repos/post_repo.dart';

class UpdatePostUsecase {
  final PostRepo postRepo;

  UpdatePostUsecase(this.postRepo);
  Future<Either<ApiErrorModel, void>> call(Post updatePost) async {
    return postRepo.updatePost(updatePost);
  }
}
