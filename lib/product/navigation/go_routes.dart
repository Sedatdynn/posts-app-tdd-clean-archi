import 'package:go_router/go_router.dart';
import 'package:posts_app/feature/posts/view/detail/detail_view.dart';
import 'package:posts_app/feature/posts/view/post_home_view.dart';
import 'package:posts_app/feature/splash/splash_view.dart';
import 'package:posts_app/product/navigation/navigation_constants.dart';
import 'package:posts_domain/posts_domain.dart';

/// GoRouter configuration
final router = GoRouter(
  routes: [
    /// initial splash page
    GoRoute(
      path: NavigationConstants.initial,
      builder: (context, state) => const SplashView(),
    ),
    //post home page
    GoRoute(
      path: NavigationConstants.home,
      builder: (context, state) => const PostsHomeView(),
    ),
    //post detail page
    GoRoute(
      path: NavigationConstants.detail,
      builder: (context, state) => PostsDetailView(post: state.extra! as PostEntity),
    ),
  ],
);
