import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';

class PostsList extends StatelessWidget {
  const PostsList({super.key, required this.post});
  final List<Post> post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: Text(
                    post[index].id.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  title: Text(
                    post[index].title ?? "",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    post[index].body ?? "",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => Divider(color: Colors.grey),
          itemCount: post.length),
    );
  }
}
