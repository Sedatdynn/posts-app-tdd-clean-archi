import 'package:core/base/usecase/base_usecase.dart';
import 'package:core/utils/typedef.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_domain/src/repository/post_repository.dart';

class AddPostUseCase extends UseCaseWithParams<void, AddPostParams> {
  const AddPostUseCase(this._repository);
  final PostRepository _repository;
  @override
  ResultFuture<void> call(AddPostParams params) async =>
      _repository.addPosts(userId: params.userId, title: params.title, body: params.body);
}

class AddPostParams extends Equatable {
  const AddPostParams({
    required this.userId,
    required this.title,
    required this.body,
  });
  const AddPostParams.empty() : this(userId: 1, title: 'empty_title', body: 'empty_body');

  final int userId;
  final String title;
  final String body;
  @override
  List<Object?> get props => [userId, title, body];
}
