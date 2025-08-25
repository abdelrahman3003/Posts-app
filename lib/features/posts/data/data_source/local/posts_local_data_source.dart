import 'dart:convert';

import 'package:posts_app/core/strings/failure.dart';
import 'package:posts_app/features/posts/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostsLocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<void> cachPosts(List<PostModel> postsModels);
}

class PostsLocalDataSourceImp implements PostsLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostsLocalDataSourceImp(this.sharedPreferences);
  @override
  Future<void> cachPosts(List<PostModel> postsModels) async {
    List<Map<String, dynamic>> postsModelsToJson = postsModels
        .map<Map<String, dynamic>>((postsModel) => postsModel.toJson())
        .toList();
    await sharedPreferences.setString(
        cachedPosts, jsonEncode(postsModelsToJson));
  }

  @override
  Future<List<PostModel>> getCachedPosts() async {
    final String? jsonString = sharedPreferences.getString(cachedPosts);
    if (jsonString != null) {
      List jsonList = jsonDecode(jsonString);
      final List<PostModel> postModelList =
          jsonList.map<PostModel>((item) => PostModel.fromJson(item)).toList();
      return postModelList;
    } else {
      throw dataEmpty;
    }
  }
}
