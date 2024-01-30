import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_data/src/data_source/post_remote_data_source_abstract.dart';
import 'package:posts_data/src/data_source/post_remote_data_source_impl.dart';
import 'package:posts_data/src/model/post_model.dart';

import '../helper/test_helpers.dart';

void main() {
  late Dio dio;
  late PostsRemoteDataSource postRemoteDataSource;
  const tUrl = 'https://jsonplaceholder.typicode.com/posts';

  setUp(() {
    dio = MockDio();
    postRemoteDataSource = PostRemoteDataSourceImpl(dio);
  });

  group('add post', () {
    final tData = {
      'userId': 1,
      'title': 'title',
      'body': 'body',
    };
    test('should complete successfully when statusCode == 201', () async {
      //arrange
      when(() => dio.post(any(), data: tData)).thenAnswer(
        (_) async => Response(requestOptions: RequestOptions(), data: 'data', statusCode: 201),
      );

      //act
      final result = postRemoteDataSource.addPosts(title: 'title', body: 'body', userId: 1);

      //assert
      expect(result, completes);
      verify(
        () => dio.post(tUrl, data: any(named: 'data')),
      ).called(1);
      verifyNoMoreInteractions(dio);
    });
    test('should return [ServerException] when statusCode != 201', () {
      //act
      when(() => dio.post(any(), data: tData)).thenAnswer(
        (_) async => Response(requestOptions: RequestOptions(), data: 'error', statusCode: 400),
      );

      //arrange
      final result = postRemoteDataSource.addPosts(title: 'title', body: 'body', userId: 1);

      //assert
      expect(result, throwsA(const ServerException(message: 'error', statusCode: 400)));

      verify(
        () => dio.post(
          '${AppConstants.baseUrl}posts',
          data: tData,
        ),
      ).called(1);
      verifyNoMoreInteractions(dio);
    });
  });

  group('get posts', () {
    const tModel = [PostModel.empty()];
    test('should return [List<PostModel>] when status code == 200 ', () async {
      //arrange
      when(() => dio.get(any())).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          data: [tModel.first.toJson()],
          statusCode: 200,
        ),
      );

      //act
      final result = await postRemoteDataSource.getPosts();

      //assert
      expect(result, equals(tModel));
      verify(() => dio.get(tUrl)).called(1);
      verifyNoMoreInteractions(dio);
    });
    const tMessage = 'Server down try later again';
    test('should throw [ServerException] when status code != 200', () async {
      //arrange
      when(() => dio.get(any())).thenAnswer(
        (_) async => Response(requestOptions: RequestOptions(), data: tMessage, statusCode: 500),
      );

      //act
      final getPostCall = postRemoteDataSource.getPosts();

      //assert
      expect(getPostCall, throwsA(const ServerException(message: tMessage, statusCode: 500)));
      verify(() => dio.get(tUrl)).called(1);
      verifyNoMoreInteractions(dio);
    });
  });
}
