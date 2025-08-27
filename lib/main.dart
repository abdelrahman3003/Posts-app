import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/dependecy_injection/dependecy_injection.dart';
import 'package:posts_app/features/posts/presentation/manager/add_delete_update_post_bloc/add_delete_update_post_bloc.dart';
import 'package:posts_app/features/posts/presentation/manager/get_posts_bloc/posts_bloc.dart';
import 'package:posts_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => PostsBloc(getit())..add(GetAllPostsEvent()),
      ),
      BlocProvider(
        create: (context) => AddDeleteUpdatePostBloc(
            addPostUsecase: getit(),
            deletePostUsecase: getit(),
            updatePostUsecase: getit()),
      ),
    ],
    child: const MyApp(),
  ));
}
