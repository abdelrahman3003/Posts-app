import 'package:flutter/material.dart';
import 'package:posts_app/core/theme/app_colors.dart';

class TextFormfieldWidget extends StatelessWidget {
  const TextFormfieldWidget(
      {super.key,
      required this.isMaltiLines,
      required this.title,
      required this.controller});
  final bool isMaltiLines;
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        maxLines: isMaltiLines ? 6 : 1,
        decoration: InputDecoration(
          hintText: title,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primary)),
        ),
        validator: (value) => value!.isEmpty ? "this field is requred" : null);
  }
}
