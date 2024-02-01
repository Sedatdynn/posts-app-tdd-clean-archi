part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class GetPostEvent extends PostsEvent {
  const GetPostEvent();
}

class CreatePostEvent extends PostsEvent {
  const CreatePostEvent({
    required this.userId,
    required this.title,
    required this.body,
  });
  final int userId;
  final String title;
  final String body;
  @override
  List<Object> get props => [userId, title, body];
}
