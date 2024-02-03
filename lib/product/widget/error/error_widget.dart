import 'package:flutter/material.dart';

class PostsErrorWidget extends StatelessWidget {
  const PostsErrorWidget({required this.errorMessage, super.key});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.red,
            ),
      ),
    );
  }
}
