import 'package:core/utils/typedef.dart';
import 'package:posts_domain/src/entity/post_entity.dart';

abstract class PostRepository {
  ResultFuture<List<PostEntity>> getPosts();
  VoidFuture addPosts({
    required int userId,
    required String title,
    required String body,
  });
}
