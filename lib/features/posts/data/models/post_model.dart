import 'package:posts_app/features/posts/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({required super.id, super.title, super.body});
  factory PostModel.fromJson(Map<String, dynamic> data) {
    return PostModel(
      id: data['id'],
      title: data['title'],
      body: data['body'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "body": body,
    };
  }
}
