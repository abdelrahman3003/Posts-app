import 'package:flutter/material.dart';
import 'package:posts_app/core/theme/app_styles.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/presentation/view/screens/post_details_page.dart';

class PostsList extends StatelessWidget {
  const PostsList({super.key, required this.posts});
  final List<Post> posts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: Text(
                    posts[index].id.toString(),
                    style: AppTextStyles.style16SemiBold,
                  ),
                  title: Text(posts[index].title ?? "",
                      style: AppTextStyles.style16SemiBold),
                  subtitle: Text(posts[index].body ?? "",
                      style: AppTextStyles.style16Regular),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PostDetailsPage(post: posts[index]),
                      )),
                ),
              ),
          separatorBuilder: (context, index) => Divider(color: Colors.grey),
          itemCount: posts.length),
    );
  }
}
