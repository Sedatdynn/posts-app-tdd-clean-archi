import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_domain/src/repository/post_repository.dart';
import 'package:posts_domain/src/usecase/add_post_usecase.dart';

import '../repository/post_repository.dart';

void main() {
  const params = AddPostParams.empty();

  late PostRepository postRepository;
  late final AddPostUseCase useCase;

  setUp(() {
    postRepository = MockPostRepository();
    useCase = AddPostUseCase(postRepository);
  });

  test('should call [PostRepository.addPost]', () async {
    //arrange
    when(
      () =>
          postRepository.addPosts(userId: 1, title: any(named: 'title'), body: any(named: 'body')),
    ).thenAnswer(
      (_) async => const Right(null),
    );
    //act
    final result = await useCase(params);

    //assert
    expect(result, equals(const Right<dynamic, void>(null)));
    verify(() => postRepository.addPosts(title: params.title, body: params.body, userId: 1))
        .called(1);
    verifyNoMoreInteractions(postRepository);
  });
}
