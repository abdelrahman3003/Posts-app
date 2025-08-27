import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/theme/app_styles.dart';
import 'package:posts_app/features/posts/presentation/manager/add_delete_update_post_bloc/add_delete_update_post_bloc.dart';

class DeleteDialogWidget extends StatelessWidget {
  const DeleteDialogWidget({super.key, required this.postId});
  final int postId;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Are you want delete this post",
        style: AppTextStyles.style16Regular,
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "NO",
            style: AppTextStyles.style16SemiBold,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context
                .read<AddDeleteUpdatePostBloc>()
                .add(DeletePostEvent(postId));
          },
          child: Text(
            "YES",
            style: AppTextStyles.style16SemiBold,
          ),
        )
      ],
    );
  }
}
