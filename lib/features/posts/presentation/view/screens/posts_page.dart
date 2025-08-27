import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/theme/app_colors.dart';
import 'package:posts_app/core/widgets/app_bar_widget.dart';
import 'package:posts_app/features/posts/presentation/manager/get_posts_bloc/posts_bloc.dart';
import 'package:posts_app/features/posts/presentation/view/screens/add_update_post_page.dart';
import 'package:posts_app/features/posts/presentation/view/widgets/post_page/loading_widget.dart';
import 'package:posts_app/features/posts/presentation/view/widgets/post_page/posts_list.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Posts"),
      body: _buidPostsbody(),
      floatingActionButton: _builFoatingActionButton(context),
    );
  }

  Widget _buidPostsbody() {
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
        if (state is LoadingPostsState) {
          return Center(child: LoadingWidget());
        } else if (state is LoadedPostsState) {
          return RefreshIndicator(
              onRefresh: () async {
                context.read<PostsBloc>().add(RefreshPostsEvent());
              },
              child: PostsList(posts: state.postsList));
        }
        return Center(child: LoadingWidget());
      },
    );
  }

  FloatingActionButton _builFoatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddUpdatePostPage(isUpdate: false),
          )),
      backgroundColor: AppColors.primary,
      child: Icon(Icons.add, color: Colors.white),
    );
  }
}
