import 'package:go_router/go_router.dart';

abstract class IGoManager {
  void init(GoRouter router);
  void go({
    required String path,
    Object? data,
  });
  Future<void> push({
    required String path,
    Object? data,
  });
  void replace({
    required String path,
    Object? data,
  });
  bool canPop();
  void pop();
  void dispose();
}
