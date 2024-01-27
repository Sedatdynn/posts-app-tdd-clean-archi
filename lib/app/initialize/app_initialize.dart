import 'package:core/navigation/go_manager.dart';
import 'package:flutter/material.dart';
import 'package:posts_app/product/navigation/go_routes.dart';

@immutable
final class AppInitialize {
  const AppInitialize._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    GoManager.instance.init(router);
  }
}
