import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_domain/src/entity/post_entity.dart';
import 'package:posts_domain/src/repository/post_repository.dart';
import 'package:posts_domain/src/usecase/get_post_usecase.dart';

import '../repository/post_repository.dart';

void main() {
  late PostRepository postRepository;
  late GetPostUseCase useCase;
  const tResponse = [PostEntity.empty()];

  setUp(() {
    postRepository = MockPostRepository();
    useCase = GetPostUseCase(postRepository);
  });

  test('should call [PostRepository.getPosts]', () async {
    //arrange
    when(() => postRepository.getPosts()).thenAnswer((_) async => const Right(tResponse));

    //act
    final result = await useCase();

    //assert
    expect(result, equals(const Right<dynamic, List<PostEntity>>(tResponse)));
    verify(() => postRepository.getPosts()).called(1);
    verifyNoMoreInteractions(postRepository);
  });
}
