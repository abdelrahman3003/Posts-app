import 'package:flutter/material.dart';
import 'package:posts_app/core/dependecy_injection/dependecy_injection.dart';
import 'package:posts_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  runApp(const MyApp());
}
