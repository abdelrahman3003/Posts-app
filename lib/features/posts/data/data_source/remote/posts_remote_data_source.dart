import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:posts_app/core/network/api_constant.dart';
import 'package:posts_app/features/posts/data/models/post_model.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';

abstract class PostsRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<void> addPost(Post post);
  Future<void> removePost(int postId);
  Future<void> updatePost(Post updatedPost);
}

class PostsRemoteDateImp implements PostsRemoteDataSource {
  final Dio dio;

  PostsRemoteDateImp(this.dio);
  @override
  Future<List<PostModel>> getAllPosts() async {
    final response =
        await dio.getUri(Uri.parse("${ApiConstant.baseUrl}/getPost"));
    if (response.statusCode == 200) {
      List responseDecode = jsonDecode(response.data);
      List<PostModel> postModelList = responseDecode
          .map<PostModel>((item) => PostModel.fromJson(item))
          .toList();
      return postModelList;
    } else {
      throw DioException(requestOptions: response.requestOptions);
    }
  }

  @override
  Future<void> addPost(Post post) async {
    final data = PostModel(id: post.id, title: post.title, body: post.body);
    final response = await dio.postUri(
        Uri.parse("${ApiConstant.baseUrl}/addPost"),
        data: data.toJson());
    if (response.statusCode == 201) {
    } else {
      throw DioException(requestOptions: response.requestOptions);
    }
  }

  @override
  Future<void> removePost(int postId) async {
    final response = await dio.deleteUri(
      Uri.parse("${ApiConstant.baseUrl}/$postId"),
    );
    if (response.statusCode == 200) {
    } else {
      throw DioException(requestOptions: response.requestOptions);
    }
  }

  @override
  Future<void> updatePost(Post updatedPost) async {
    final data = PostModel(title: updatedPost.title, body: updatedPost.body);
    final response = await dio.patchUri(
        Uri.parse("${ApiConstant.baseUrl}/${updatedPost.id}"),
        data: data.toJson());
    if (response.statusCode == 201) {
    } else {
      throw DioException(requestOptions: response.requestOptions);
    }
  }
}
