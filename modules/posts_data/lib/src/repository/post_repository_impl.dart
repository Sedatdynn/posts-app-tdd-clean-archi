import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:posts_data/src/data_source/post_remote_data_source_abstract.dart';
import 'package:posts_domain/posts_domain.dart';

class PostRepositoryImpl implements PostRepository {
  const PostRepositoryImpl(this._remoteDataSource);
  final PostsRemoteDataSource _remoteDataSource;
  @override
  VoidFuture addPosts({required int userId, required String title, required String body}) async {
    try {
      final response = await _remoteDataSource.addPosts(title: title, body: body, userId: userId);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<PostEntity>> getPosts() async {
    try {
      final response = await _remoteDataSource.getPosts();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
