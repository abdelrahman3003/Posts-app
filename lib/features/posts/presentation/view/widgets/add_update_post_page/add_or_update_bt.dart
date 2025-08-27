import 'package:flutter/material.dart';
import 'package:posts_app/core/theme/app_colors.dart';
import 'package:posts_app/core/theme/app_styles.dart';

class AddOrUpdateBt extends StatelessWidget {
  const AddOrUpdateBt({super.key, required this.isUpdate, this.onPressed});
  final bool isUpdate;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
      ),
      label: Text(isUpdate ? "Update" : "Add",
          style: AppTextStyles.style16Regular.copyWith(color: AppColors.white)),
      icon: Icon(
        isUpdate ? Icons.update : Icons.add,
        color: Colors.white,
      ),
    );
  }
}
