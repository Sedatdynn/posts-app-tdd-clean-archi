import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAsset extends StatelessWidget {
  const LottieAsset({required this.path, super.key});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(path);
  }
}
