import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_app/app/initialize/app_initialize.dart';
import 'package:posts_app/product/navigation/go_routes.dart';

Future<void> main() async {
  await AppInitialize.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          routerConfig: router,
        );
      },
    );
  }
}
