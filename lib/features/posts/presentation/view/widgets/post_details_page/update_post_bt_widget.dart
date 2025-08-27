import 'package:flutter/material.dart';
import 'package:posts_app/core/theme/app_colors.dart';
import 'package:posts_app/core/theme/app_styles.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/presentation/view/screens/add_update_post_page.dart';

class UpdatePostBtWidget extends StatelessWidget {
  const UpdatePostBtWidget({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddUpdatePostPage(isUpdate: true, post: post),
            ));
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
      ),
      label: Text("Update",
          style: AppTextStyles.style16Regular.copyWith(color: AppColors.white)),
      icon: Icon(
        Icons.update,
        color: Colors.white,
      ),
    );
  }
}
