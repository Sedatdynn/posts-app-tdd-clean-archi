import 'package:core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/feature/posts/bloc/bloc/posts_bloc.dart';
import 'package:posts_app/product/global/bloc/global_bloc.dart';
import 'package:posts_app/product/widget/app_bar/custom_app_bar.dart';
import 'package:posts_app/product/widget/error/error_widget.dart';
import 'package:posts_app/product/widget/loading/loading_circular.dart';
import 'package:posts_domain/posts_domain.dart';
part './post_home_subview.dart';

class PostsHomeView extends StatelessWidget {
  const PostsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'POSTS'),
      body: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, state) {
          if (!state.isConnected) {
            return const PostsErrorWidget(errorMessage: 'NO CONNECTION');
          }
          if (state.isConnected) {
            return BlocBuilder<PostsBloc, PostsState>(
              builder: (context, state) {
                return state.isLoading
                    ? const LoadingCircular()
                    : state.errorMessage != null
                        ? PostsErrorWidget(errorMessage: state.errorMessage.toString())
                        : PostsBodyList(posts: state.posts.reversed.toList());
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
