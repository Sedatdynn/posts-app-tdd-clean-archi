import 'package:core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePostActionChip extends StatelessWidget {
  const CreatePostActionChip({required this.onPressed, super.key});
  final void Function(BuildContext context) onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      padding: EdgeInsets.all(12.w),
      backgroundColor: context.theme.colorScheme.secondary,
      label: Text(
        'Create user',
        style: context.textTheme.bodyLarge?.copyWith(color: context.theme.colorScheme.background),
      ),
      avatar: const Icon(Icons.create),
      onPressed: () => onPressed(context),
    );
  }
}
