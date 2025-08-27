import 'package:flutter/material.dart';
import 'package:posts_app/core/theme/app_styles.dart';

class SnackbarMessage {
  showSnackBarSuccess(String message, BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
            style: AppTextStyles.style16Regular.copyWith(color: Colors.white)),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.lightGreen,
      ),
    );
  }

  showSnackBarError(String message, BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
            style: AppTextStyles.style16Regular.copyWith(color: Colors.white)),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
