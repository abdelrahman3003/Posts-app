import 'package:dartz/dartz.dart';
import 'package:posts_app/core/network/api_error_model.dart';
import 'package:posts_app/features/posts/domain/repos/post_repo.dart';

class DeletePostUsecase {
  final PostRepo postRepo;

  DeletePostUsecase(this.postRepo);
  Future<Either<ApiErrorModel, void>> call(int postId) async {
    return postRepo.removePost(postId);
  }
}
