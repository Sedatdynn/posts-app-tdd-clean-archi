import 'package:core/core.dart';
import 'package:core/utils/typedef.dart';

import 'package:dio/dio.dart';
import 'package:posts_data/src/data_source/post_remote_data_source_abstract.dart';
import 'package:posts_data/src/model/post_model.dart';

class PostRemoteDataSourceImpl extends PostsRemoteDataSource {
  PostRemoteDataSourceImpl(this._dio);
  final Dio _dio;

  @override
  Future<void> addPosts({required String title, required String body, required int userId}) async {
    try {
      final response = await _dio.post(
        '${AppConstants.baseUrl}posts',
        data: {
          'userId': userId,
          'title': title,
          'body': body,
        },
      );
      if (response.statusCode != 201) {
        throw ServerException(
          message: response.data.toString(),
          statusCode: response.statusCode!,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await _dio.get('${AppConstants.baseUrl}posts');
      if (response.statusCode != 200) {
        throw ServerException(
          message: response.data.toString(),
          statusCode: response.statusCode!,
        );
      }
      return List<DataMap>.from(response.data as List).map(PostModel.fromJson).toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
}
