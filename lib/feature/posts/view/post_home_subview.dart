part of 'post_home_view.dart';

class PostsBodyList extends StatelessWidget {
  const PostsBodyList({required this.posts, super.key});
  final List<PostEntity> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const Key('posts_list'),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            onTap: () =>
                GoManager.instance.push(path: NavigationConstants.detail, data: posts[index]),
            leading: CircleAvatar(child: Text(posts[index].id.toString())),
            title: Text(
              posts[index].title.toString(),
              style: context.textTheme.titleLarge,
            ),
            subtitle: Text(
              posts[index].body.toString(),
              style: context.textTheme.bodyMedium,
            ),
          ),
        );
      },
    );
  }
}
