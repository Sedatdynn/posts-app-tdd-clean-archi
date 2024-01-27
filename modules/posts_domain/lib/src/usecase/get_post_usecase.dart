import 'package:core/base/usecase/base_usecase.dart';
import 'package:core/utils/typedef.dart';
import 'package:posts_domain/src/entity/post_entity.dart';
import 'package:posts_domain/src/repository/post_repository.dart';

class GetPostUseCase extends UseCaseWithoutParams<List<PostEntity>> {
  const GetPostUseCase(this._repository);
  final PostRepository _repository;
  @override
  ResultFuture<List<PostEntity>> call() async => _repository.getPosts();
}
