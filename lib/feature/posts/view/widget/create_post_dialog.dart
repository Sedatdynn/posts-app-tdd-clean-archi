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
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleTextController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'enter title',
                ),
              ),
              TextField(
                controller: bodyTextController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'enter body',
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              BlocListener<PostsBloc, PostsState>(
                listener: (context, state) {
                  if (state.isPostCreated == null || state.isPostCreated == false) return;
                  if (state.isPostCreated!) GoManager.instance.pop();
                },
                child: ActionChip(
                  padding: EdgeInsets.all(12.w),
                  backgroundColor: context.theme.colorScheme.secondary,
                  label: Text(
                    'Create user',
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: context.theme.colorScheme.background),
                  ),
                  avatar: const Icon(Icons.create),
                  onPressed: () => createUser(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
