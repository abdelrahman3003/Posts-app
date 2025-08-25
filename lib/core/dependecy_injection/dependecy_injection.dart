import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_app/core/network/network_info.dart';
import 'package:posts_app/core/utls/dio_factory.dart';
import 'package:posts_app/features/posts/data/data_source/local/posts_local_data_source.dart';
import 'package:posts_app/features/posts/data/data_source/remote/posts_remote_data_source.dart';
import 'package:posts_app/features/posts/data/repos_impl/post_repos_impl.dart';
import 'package:posts_app/features/posts/domain/repos/post_repo.dart';
import 'package:posts_app/features/posts/domain/usecases/add_post_usecase.dart';
import 'package:posts_app/features/posts/domain/usecases/delete_post_usecase.dart';
import 'package:posts_app/features/posts/domain/usecases/get_all_posts_usecase.dart';
import 'package:posts_app/features/posts/domain/usecases/update_post_usecase.dart';
import 'package:posts_app/features/posts/presentation/manager/add_delete_update_post_bloc/add_delete_update_post_bloc.dart';
import 'package:posts_app/features/posts/presentation/manager/get_posts_bloc/posts_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getit = GetIt.instance;
Future<void> initGetIt() async {
  final dio = DioFactory.getDio();
  final sharedPreferences = await SharedPreferences.getInstance();
  final internetConnectionChecker = InternetConnectionChecker.createInstance();

  //! Core
  getit.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectChecker: getit()));

  //! External
  getit.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getit.registerLazySingleton<Dio>(() => dio);
  getit.registerLazySingleton<InternetConnectionChecker>(
      () => internetConnectionChecker);

  //! Posts Features

  //Blocs
  getit.registerFactory<PostsBloc>(() => PostsBloc(getit()));
  getit.registerFactory<AddDeleteUpdatePostBloc>(
    () => AddDeleteUpdatePostBloc(
      addPostUsecase: getit(),
      updatePostUsecase: getit(),
      deletePostUsecase: getit(),
    ),
  );

  // UseCases
  getit.registerLazySingleton<GetAllPostsUsecase>(
      () => GetAllPostsUsecase(getit()));
  getit.registerLazySingleton<AddPostUsecase>(() => AddPostUsecase(getit()));
  getit.registerLazySingleton<DeletePostUsecase>(
      () => DeletePostUsecase(getit()));
  getit.registerLazySingleton<UpdatePostUsecase>(
      () => UpdatePostUsecase(getit()));

  // Repository
  getit.registerLazySingleton<PostRepo>(
      () => PostReposImpl(getit(), getit(), getit()));

  // Data Source
  getit.registerLazySingleton<PostsRemoteDataSource>(
      () => PostsRemoteDatdImp(getit()));
  getit.registerLazySingleton<PostsLocalDataSource>(
      () => PostsLocalDataSourceImp(getit()));
}
