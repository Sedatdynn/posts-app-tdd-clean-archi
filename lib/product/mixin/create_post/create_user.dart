import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/feature/posts/bloc/bloc/posts_bloc.dart';

mixin CreateUserMixin {
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController bodyTextController = TextEditingController();

  void createUser(BuildContext context) {
    if (titleTextController.text.isEmpty || bodyTextController.text.isEmpty) {
      return;
    }
    context.read<PostsBloc>().add(
          CreatePostEvent(
            userId: 1,
            title: titleTextController.text,
            body: bodyTextController.text,
          ),
        );
  }
}
