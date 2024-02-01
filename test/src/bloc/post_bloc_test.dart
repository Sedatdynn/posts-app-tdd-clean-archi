import 'package:bloc_test/bloc_test.dart';
import 'package:core/exception/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_app/feature/posts/bloc/bloc/posts_bloc.dart';
import 'package:posts_domain/posts_domain.dart';

class MockGetPostUseCase extends Mock implements GetPostUseCase {}

class MockAddPostUseCase extends Mock implements AddPostUseCase {}

void main() {
  late GetPostUseCase getPostUseCase;
  late AddPostUseCase addPostUseCase;
  late PostsBloc postsBloc;

  setUp(() {
    getPostUseCase = MockGetPostUseCase();
    addPostUseCase = MockAddPostUseCase();
    postsBloc = PostsBloc(getPostUseCase: getPostUseCase, addPostUseCase: addPostUseCase);
  });

  const testPostEntity = [PostEntity.empty()];
  // in the beginning isLoading always true and posts is []
  const firstPostState = PostsState(
    posts: [],
    errorMessage: null,
    isLoading: true,
    isConnect: true,
    isPostCreated: null,
  );
  const testFailure = ServerFailure(message: 'ERROR', statusCode: 505);

  test('initial state should be [PostState.initial]', () {
    expect(postsBloc.state, PostsState.initial());
  });
  group('get posts', () {
    blocTest<PostsBloc, PostsState>(
      'should emit [Post State] isLoading and get posts',
      build: () {
        when(() => getPostUseCase.call()).thenAnswer((_) async => const Right(testPostEntity));
        return postsBloc;
      },
      act: (bloc) => bloc.add(const GetPostEvent()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        // isLoading is true and posts empty list []
        firstPostState,
        // isLoading false and posts is not empty list anymore
        const PostsState(
          posts: testPostEntity,
          errorMessage: null,
          isLoading: false,
          isConnect: true,
          isPostCreated: null,
        ),
      ],
    );
    blocTest<PostsBloc, PostsState>(
      'should emit [Post State] error message',
      build: () {
        when(() => getPostUseCase.call()).thenAnswer((_) async => const Left(testFailure));
        return postsBloc;
      },
      act: (bloc) => bloc.add(const GetPostEvent()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        // isLoading is true and posts empty list []
        firstPostState,
        // isLoading false and posts is not empty list anymore
        const PostsState(
          posts: [],
          errorMessage: '505,  Error: ERROR',
          isLoading: false,
          isConnect: true,
          isPostCreated: null,
        ),
      ],
    );
  });
  group('create posts', () {
    blocTest<PostsBloc, PostsState>(
      'should emit [Post State] isLoading and create post successfully',
      build: () {
        when(() => addPostUseCase.call(const AddPostParams.empty()))
            .thenAnswer((_) async => const Right(null));
        return postsBloc;
      },
      act: (bloc) =>
          bloc.add(const CreatePostEvent(userId: 1, title: 'empty_title', body: 'empty_body')),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        // isLoading is true and isPostCreated = null
        firstPostState,
        // isLoading false and isPostCreated = true
        const PostsState(
          posts: [],
          errorMessage: null,
          isLoading: false,
          isConnect: true,
          isPostCreated: true,
        ),
      ],
    );
    blocTest<PostsBloc, PostsState>(
      'should emit [Post State] errorMessage and isPostCreated = false',
      build: () {
        when(() => addPostUseCase.call(const AddPostParams.empty()))
            .thenAnswer((_) async => const Left(testFailure));
        return postsBloc;
      },
      act: (bloc) =>
          bloc.add(const CreatePostEvent(userId: 1, title: 'empty_title', body: 'empty_body')),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        // isLoading is true and isPostCreated = null
        firstPostState,
        // isLoading false and isPostCreated = false
        const PostsState(
          posts: [],
          errorMessage: '505,  Error: ERROR',
          isLoading: false,
          isConnect: true,
          isPostCreated: false,
        ),
      ],
    );
  });
}
