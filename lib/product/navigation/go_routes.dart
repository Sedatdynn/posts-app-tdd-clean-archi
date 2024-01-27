import 'package:go_router/go_router.dart';
import 'package:posts_app/product/navigation/navigation_constants.dart';

/// GoRouter configuration
final router = GoRouter(
  routes: [
    /// initial splash page
    GoRoute(
      path: NavigationConstants.initial,
      // builder: (context, state) => SplashView(),
    ),
  ],
);
