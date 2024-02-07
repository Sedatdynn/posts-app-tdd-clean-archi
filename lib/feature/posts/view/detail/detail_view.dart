import 'package:core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_domain/posts_domain.dart';

class PostsDetailView extends StatelessWidget {
  const PostsDetailView({required this.post, super.key});
  final PostEntity post;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: const Key('POST_DETAIL_VIEW'),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: context.colorScheme.onInverseSurface,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  CircleAvatar(
                    minRadius: 40.h,
                    child: Text(post.id.toString()),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: context.colorScheme.onPrimaryContainer,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                    ),
                    child: Text(
                      post.title.toString(),
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge
                          ?.copyWith(color: context.colorScheme.background),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    post.body.toString(),
                    style: context.textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
