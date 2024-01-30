import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_data/src/data_source/post_remote_data_source_abstract.dart';
import 'package:posts_data/src/model/post_model.dart';
import 'package:posts_data/src/repository/post_repository_impl.dart';
import 'package:posts_domain/posts_domain.dart';

import '../helper/test_helpers.dart';

void main() {
  late PostsRemoteDataSource postsRemoteDataSource;
  late PostRepository postsRepository;

  setUp(() {
    postsRemoteDataSource = MockDataSource();
    postsRepository = PostRepositoryImpl(postsRemoteDataSource);
  });
  const tException = ServerException(
    message: 'Unknown error ocurred',
    statusCode: 500,
  );

  group('addPosts', () {
    test('call [PostsRemoteDataSource.addPosts] and complete successfully', () async {
      //arrange
      when(() => postsRemoteDataSource.addPosts(title: 'title', body: 'body', userId: 1))
          .thenAnswer((_) async => Future.value());
      //act
      final result = await postsRepository.addPosts(title: 'title', body: 'body', userId: 1);

      //assert
      expect(result, equals(const Right<dynamic, void>(null)));
      verify(() => postsRemoteDataSource.addPosts(title: 'title', body: 'body', userId: 1))
          .called(1);
      verifyNoMoreInteractions(postsRemoteDataSource);
    });

    test('should return [ServerFailure] when call [PostsRemoteDataSource.addPosts] unsuccessfully',
        () async {
      //arrange
      when(() => postsRemoteDataSource.addPosts(title: 'title', body: 'body', userId: 1))
          .thenThrow(tException);
      //act
      final result = await postsRepository.addPosts(title: 'title', body: 'body', userId: 1);

      //assert
      expect(result, equals(Left<dynamic, ServerFailure>(ServerFailure.fromException(tException))));
      verify(() => postsRemoteDataSource.addPosts(title: 'title', body: 'body', userId: 1))
          .called(1);
      verifyNoMoreInteractions(postsRemoteDataSource);
    });
  });

  group('getPosts', () {
    const expectedResponse = [PostModel.empty()];
    test('should call [PostsRemoteDataSource.getPosts]', () async {
      //arrange
      when(() => postsRemoteDataSource.getPosts()).thenAnswer((_) async => expectedResponse);

      //act
      final result = await postsRepository.getPosts();

      // assert
      expect(result, isA<Right<dynamic, List<PostEntity>>>());
      verify(() => postsRemoteDataSource.getPosts()).called(1);
      verifyNoMoreInteractions(postsRemoteDataSource);
    });

    test('should return [ServerFailure] when call [PostsRemoteDataSource.getPosts] unsuccessfully',
        () async {
      //arrange
      when(() => postsRemoteDataSource.getPosts()).thenThrow(tException);

      //act
      final result = await postsRepository.getPosts();

      //assert
      expect(result, equals(Left<dynamic, ServerFailure>(ServerFailure.fromException(tException))));
    });
  });
}
