import 'package:posts_app/feature/posts/view/index.dart';
part './post_home_subview.dart';
part './widget/create_post_dialog.dart';

class PostsHomeView extends StatelessWidget {
  const PostsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog<void>(context: context, builder: (context) => CreatePostDialog());
        },
        child: const Icon(Icons.add),
      ),
      appBar: const CustomAppBar(title: 'POSTS'),
      body: BlocBuilder<GlobalBloc, GlobalState>(
        buildWhen: (previous, current) => previous.isConnected != current.isConnected,
        builder: (context, globalState) {
          if (!globalState.isConnected) {
            return const PostsErrorWidget(errorMessage: 'No Connection');
          } else {
            return BlocBuilder<PostsBloc, PostsState>(
              builder: (context, postsState) {
                return postsState.isLoading
                    ? const LoadingCircular()
                    : postsState.errorMessage != null
                        ? PostsErrorWidget(errorMessage: postsState.errorMessage.toString())
                        : PostsBodyList(posts: postsState.posts.reversed.toList());
              },
            );
          }
        },
      ),
    );
  }
}
