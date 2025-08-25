import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/dependecy_injection/dependecy_injection.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/presentation/manager/add_delete_update_post_bloc/add_delete_update_post_bloc.dart';
import 'package:posts_app/features/posts/presentation/view/screens/add_update_post_page.dart';

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
                    style: TextStyle(fontSize: 16),
                  ),
                  title: Text(
                    posts[index].title ?? "",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    posts[index].body ?? "",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => AddDeleteUpdatePostBloc(
                            addPostUsecase: getit(),
                            updatePostUsecase: getit(),
                            deletePostUsecase: getit(),
                          ),
                          child: AddUpdatePostPage(
                            isUpdate: true,
                            post: posts[index],
                          ),
                        ),
                      )),
                ),
              ),
          separatorBuilder: (context, index) => Divider(color: Colors.grey),
          itemCount: posts.length),
    );
  }
}
