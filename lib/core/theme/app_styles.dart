import 'package:flutter/material.dart';
import 'package:posts_app/core/theme/app_colors.dart';
import 'package:posts_app/core/theme/app_font.dart';

class AppTextStyles {
  static const TextStyle _base16 = TextStyle(
    fontSize: 16,
    color: AppColors.black,
  );

  static final TextStyle style16Regular = _base16.copyWith(
    fontWeight: AppFonts.regular,
    color: AppColors.grey,
  );

  static final TextStyle style16SemiBold = _base16.copyWith(
    fontWeight: AppFonts.semiBold,
  );
  static final TextStyle style22SemiBold = _base16.copyWith(
    fontWeight: AppFonts.semiBold,
    fontSize: 22,
    color: AppColors.white,
  );
}
