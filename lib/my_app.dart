import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/presentation/view/screens/posts_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Posts",
      home: PostsPage(),
    );
  }
}
