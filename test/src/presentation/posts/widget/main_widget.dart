import 'package:core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:posts_app/feature/posts/view/index.dart';

Widget testableWidgetNavigation({
  required GlobalBloc mockGlobalBloc,
  required PostsBloc mockPostBloc,
  required GoRouter testRouter,
}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => mockGlobalBloc,
      ),
      BlocProvider<PostsBloc>(
        create: (context) => mockPostBloc,
      ),
    ],
    child: ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: appLightTheme,
          routerConfig: testRouter,
        );
      },
    ),
  );
}
