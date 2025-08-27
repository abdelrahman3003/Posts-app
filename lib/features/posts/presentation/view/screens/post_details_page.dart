import 'package:flutter/material.dart';
import 'package:posts_app/core/theme/app_colors.dart';
import 'package:posts_app/core/theme/app_styles.dart';
import 'package:posts_app/core/widgets/app_bar_widget.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/presentation/view/widgets/post_details_page/delete_post_bt_widget.dart';
import 'package:posts_app/features/posts/presentation/view/widgets/post_details_page/update_post_bt_widget.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Post Details"),
      body: _builBody(context),
    );
  }

  Widget _builBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            post.title ?? "",
            style: AppTextStyles.style16SemiBold,
          ),
          SizedBox(height: 10),
          Divider(
            color: AppColors.grey,
          ),
          SizedBox(height: 10),
          Text(
            post.body ?? "",
            style: AppTextStyles.style16Regular,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UpdatePostBtWidget(post: post),
              SizedBox(
                width: 15,
              ),
              DeletePostBtWidget(postId: post.id!)
            ],
          )
        ],
      ),
    );
  }
}
