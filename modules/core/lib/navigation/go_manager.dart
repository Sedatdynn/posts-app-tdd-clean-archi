import 'package:core/navigation/i_go_manager.dart';
import 'package:go_router/go_router.dart';

class GoManager implements IGoManager {
  static final GoManager _instance = GoManager._init();
  static GoManager get instance => _instance;
  GoManager._init();

  late GoRouter _router;

  @override
  init(GoRouter router) {
    _router = router;
  }

  @override
  void go({
    required String path,
    Map<String, String>? queryParameters,
    Object? data,
  }) {
    _router.go(
      Uri(path: path, queryParameters: queryParameters).toString(),
      extra: data,
    );
  }

  @override
  Future push({
    required String path,
    Map<String, String>? queryParameters,
    Object? data,
  }) async {
    await _router.push(
      Uri(path: path, queryParameters: queryParameters).toString(),
      extra: data,
    );
  }

  @override
  void replace({
    required String path,
    Map<String, String>? queryParameters,
    Object? data,
  }) {
    _router.replace(
      Uri(path: path, queryParameters: queryParameters).toString(),
      extra: data,
    );
  }

  @override
  bool canPop() => _router.canPop();

  @override
  void pop() => _router.pop();

  @override
  void dispose() => _router.dispose();
}
