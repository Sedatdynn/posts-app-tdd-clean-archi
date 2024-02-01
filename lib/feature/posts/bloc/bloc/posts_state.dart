part of 'posts_bloc.dart';

final class PostsState extends Equatable {
  const PostsState({
    required this.posts,
    required this.errorMessage,
    required this.isLoading,
    required this.isConnect,
    required this.isPostCreated,
  });

  //initial state cases
  factory PostsState.initial() {
    return const PostsState(
      posts: [],
      errorMessage: null,
      isLoading: false,
      isConnect: true,
      isPostCreated: null,
    );
  }
  final List<PostEntity> posts;
  final String? errorMessage;
  final bool isLoading;
  final bool isConnect;
  final bool? isPostCreated;

  @override
  List<Object?> get props =>
      [posts.map((e) => e), errorMessage, isLoading, isConnect, isPostCreated];

  //copyWith
  PostsState copyWith({
    List<PostEntity>? posts,
    String? errorMessage,
    bool? isLoading,
    bool? isConnect,
    bool? isPostCreated,
  }) {
    return PostsState(
      posts: posts ?? this.posts,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isConnect: isConnect ?? this.isConnect,
      isPostCreated: isPostCreated ?? this.isPostCreated,
    );
  }
}
