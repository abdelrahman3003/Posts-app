import 'package:flutter/material.dart';
import 'package:posts_app/core/theme/app_colors.dart';
import 'package:posts_app/core/theme/app_styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      title: Text(title, style: AppTextStyles.style22SemiBold),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
