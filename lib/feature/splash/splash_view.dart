import 'package:core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:posts_app/gen/assets.gen.dart';
import 'package:posts_app/product/widget/lottie_widget.dart';

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
        .then((value) => debugPrint('3 seconds completed'));
  }
}
