import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/dependecy_injection/dependecy_injection.dart';
import 'package:posts_app/features/posts/presentation/manager/get_posts_bloc/posts_bloc.dart';
import 'package:posts_app/features/posts/presentation/view/widgets/loading_widget.dart';
import 'package:posts_app/features/posts/presentation/view/widgets/posts_list.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(getit())..add(GetAllPostsEvent()),
      child: Scaffold(
        appBar: _buildAppbar(),
        body: _buidPostsbody(),
      ),
    );
  }

  Widget _buidPostsbody() {
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
        if (state is LoadingPostsState) {
          return Center(child: LoadingWidget());
        } else if (state is LoadedPostsState) {
          return PostsList(post: state.postsList);
        }
        return Center(child: LoadingWidget());
      },
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
      title: Text(
        "Posts",
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
