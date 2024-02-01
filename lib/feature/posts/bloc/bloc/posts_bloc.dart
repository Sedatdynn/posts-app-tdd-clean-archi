import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_domain/posts_domain.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc({required GetPostUseCase getPostUseCase, required AddPostUseCase addPostUseCase})
      : _getPostUseCase = getPostUseCase,
        _addPostUseCase = addPostUseCase,
        super(PostsState.initial()) {
    on<GetPostEvent>(_getPostsHandler);
    on<CreatePostEvent>(_createPostsHandler);
  }

  final GetPostUseCase _getPostUseCase;
  final AddPostUseCase _addPostUseCase;
  Future<void> _getPostsHandler(
    GetPostEvent event,
    Emitter<PostsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getPostUseCase();
    result.fold((failure) {
      emit(
        state.copyWith(errorMessage: failure.errorMessage, isLoading: false),
      );
    }, (posts) {
      emit(state.copyWith(posts: posts, isLoading: false));
    });
  }

  Future<void> _createPostsHandler(
    CreatePostEvent event,
    Emitter<PostsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _addPostUseCase(
      AddPostParams(title: event.title, body: event.body, userId: event.userId),
    );
    result.fold((failure) {
      log('LEFT ERROR: ${failure.errorMessage}');

      emit(
        state.copyWith(errorMessage: failure.errorMessage, isPostCreated: false, isLoading: false),
      );
    }, (_) {
      log('RIGHT SUCCESS: ');
      emit(state.copyWith(isPostCreated: true, isLoading: false));
    });
  }
}
