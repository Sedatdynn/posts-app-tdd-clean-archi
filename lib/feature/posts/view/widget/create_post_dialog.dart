part of '../post_home_view.dart';

class CreatePostDialog extends StatelessWidget with CreateUserMixin {
  CreatePostDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(controller: titleTextController, hintText: 'enter title'),
              CustomTextField(controller: bodyTextController, hintText: 'enter body'),
              SizedBox(
                height: 12.h,
              ),
              BlocListener<PostsBloc, PostsState>(
                listener: (context, state) {
                  if (state.isPostCreated == null || state.isPostCreated == false) return;
                  if (state.isPostCreated!) GoManager.instance.pop();
                },
                child: CreatePostActionChip(onPressed: createUser),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
