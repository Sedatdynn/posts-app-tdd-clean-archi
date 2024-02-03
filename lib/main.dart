import 'package:core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injection_container/injection_container.dart';
import 'package:posts_app/app/initialize/app_initialize.dart';
import 'package:posts_app/feature/posts/bloc/bloc/posts_bloc.dart';
import 'package:posts_app/product/global/bloc/global_bloc.dart';
import 'package:posts_app/product/navigation/go_routes.dart';

Future<void> main() async {
  await AppInitialize.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBlocProviders(
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: appLightTheme,
            routerConfig: router,
          );
        },
      ),
    );
  }
}

class CustomBlocProviders extends MultiBlocProvider {
  CustomBlocProviders({required super.child, super.key})
      : super(
          providers: [
            BlocProvider(
              create: (context) => locator<GlobalBloc>(),
            ),
            BlocProvider(
              create: (context) => locator<PostsBloc>(),
            ),
          ],
        );
}
