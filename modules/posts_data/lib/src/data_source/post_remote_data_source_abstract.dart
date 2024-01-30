import 'package:posts_data/src/model/post_model.dart';

abstract class PostsRemoteDataSource {
  Future<void> addPosts({required String title, required String body, required int userId});
  Future<List<PostModel>> getPosts();
}
