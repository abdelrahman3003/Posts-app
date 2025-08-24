import 'package:flutter/material.dart';
import 'package:posts_app/core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Posts",
      theme: appTheme,
      home: Container(),
    );
  }
}
