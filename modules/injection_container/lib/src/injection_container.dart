import 'package:get_it/get_it.dart';
import 'package:posts_app/product/global/bloc/global_bloc.dart';
import 'package:posts_data/posts_data.dart';
import 'package:posts_domain/posts_domain.dart';
import 'package:dio/dio.dart';

final locator = GetIt.instance;

class LocatorService {
  const LocatorService();

  static Future<void> init() async {
    locator
      //BLOC
      ..registerFactory(
        GlobalBloc.new,
      )

      //USECASE
      ..registerLazySingleton(
        () => GetPostUseCase(locator()),
      )
      ..registerLazySingleton(
        () => AddPostUseCase(locator()),
      )
      //REPOSITORIES
      ..registerLazySingleton<PostRepository>(
        () => PostRepositoryImpl(locator()),
      )
      //DATA SOURCES
      ..registerLazySingleton<PostsRemoteDataSource>(
        () => PostRemoteDataSourceImpl(locator()),
      )
      //DIO
      ..registerLazySingleton(Dio.new);
  }
}
