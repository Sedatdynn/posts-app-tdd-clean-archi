import 'package:core/extension/context_extension.dart';
import 'package:core/navigation/go_manager.dart';
import 'package:flutter/material.dart';
import 'package:posts_app/gen/assets.gen.dart';
import 'package:posts_app/product/navigation/navigation_constants.dart';
import 'package:posts_app/product/widget/lottie/lottie_widget.dart';

class SplashView extends StatelessWidget with SplashMixin {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    navigate();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieAsset(path: Assets.lottie.splash),
          Text('Posts loading...', style: context.textTheme.titleLarge),
        ],
      ),
    );
  }
}

mixin SplashMixin on StatelessWidget {
  Future<void> navigate() async {
    await Future<void>.delayed(const Duration(seconds: 3))
        .then((value) => GoManager.instance.replace(path: NavigationConstants.home));
  }
}
