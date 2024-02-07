import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:posts_app/feature/posts/view/index.dart';
import 'package:posts_app/feature/splash/splash_view.dart';

void main() {
  Widget testableWidget(Widget body) {
    return MaterialApp(
      home: body,
    );
  }

  testWidgets('find lottie asset when splash triggered', (widgetTester) async {
    //act
    await widgetTester.pumpWidget(testableWidget(const SplashView()));
    final splashColumn = find.byKey(const Key('splash_column'));
    final loadingText = find.byType(Text);
    final lottie = find.byType(Lottie);

    //assert
    expect(splashColumn, findsOneWidget);
    expect(loadingText, findsOneWidget);
    expect(lottie, findsOneWidget);
  });
}
