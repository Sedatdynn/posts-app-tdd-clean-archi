import 'dart:io';

import 'package:core/theme/app_theme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_app/feature/posts/view/detail/detail_view.dart';
import 'package:posts_app/feature/posts/view/index.dart';
import 'package:posts_app/feature/posts/view/post_home_view.dart';
import 'package:posts_app/feature/splash/splash_view.dart';
import 'package:posts_app/product/navigation/navigation_constants.dart';

import 'helper/post_helper.dart';
import 'widget/main_widget.dart';

final testRouter = GoRouter(
  routes: [
    /// initial splash page
    GoRoute(
      path: NavigationConstants.initial,
      builder: (context, state) => const SplashView(),
    ),
    //post home page
    GoRoute(
      path: NavigationConstants.home,
      builder: (context, state) => const PostsHomeView(),
    ),
    //post detail page
    GoRoute(
      path: NavigationConstants.detail,
      builder: (context, state) => const PostsDetailView(post: PostEntity.empty()),
    ),
  ],
);

void main() {
  late GlobalBloc mockGlobalBloc;
  late PostsBloc mockPostBloc;

  setUpAll(() {
    mockGlobalBloc = MockGlobalBloc();
    mockPostBloc = MockPostBloc();
    HttpOverrides.global = null;
    GoManager.instance.init(testRouter);
  });

  testWidgets('should navigate to detail view when click on post ListTile', (widgetTester) async {
    //arrange
    when(() => mockGlobalBloc.state).thenReturn(
      const GlobalState(isConnected: true),
    );
    when(() => mockPostBloc.state).thenReturn(
      const PostsState(
        posts: [PostEntity.empty()],
        errorMessage: null,
        isLoading: false,
        isConnect: true,
        isPostCreated: false,
      ),
    );

    //act
    await widgetTester.pumpWidget(
      testableWidgetNavigation(
        mockGlobalBloc: mockGlobalBloc,
        mockPostBloc: mockPostBloc,
        testRouter: testRouter,
      ),
    );
    await widgetTester.pumpAndSettle();

    /// first splash screen
    final splash = find.byKey(const Key('splash_column'));
    expect(splash, findsOneWidget);
    await widgetTester.pump(const Duration(seconds: 4));
    expect(splash, findsNothing);

    ///post home page
    final postsListTile = find.byType(ListTile);

    //assert
    expect(postsListTile, findsOneWidget);

    /// click on listTile to navigate detail page
    await widgetTester.tap(postsListTile);
    await widgetTester.pump(const Duration(seconds: 4));
    await widgetTester.pumpAndSettle();

    /// FIND DETAIL PAGE
    final postDetail = find.byKey(const Key('POST_DETAIL_VIEW'));
    expect(postDetail, findsOneWidget);

    final detailImage = find.byType(CircleAvatar);

    /// find CircleAvatar widget
    final circleImage = widgetTester.widget<CircleAvatar>(detailImage);
    expect(detailImage, findsOneWidget);
    expect(circleImage.minRadius, equals(40.h));

    /// find Container widget
    final detailContainer = find.byKey(const Key('detail_container'));
    // make widget to can use widget's components
    final container = widgetTester.widget<Container>(detailContainer);
    expect(detailContainer, findsOneWidget);
    //check padding
    expect(container.padding, equals(const EdgeInsets.all(12)));
    //check color
    expect(
      (container.decoration! as BoxDecoration).color,
      appLightTheme.colorScheme.onPrimaryContainer,
    );
    //check borderRadius
    expect(
      (container.decoration! as BoxDecoration).borderRadius,
      const BorderRadius.only(
        topRight: Radius.circular(16),
        topLeft: Radius.circular(16),
      ),
    );

    /// find detail body text widget
    final bodyText = find.byKey(const Key('detail_body_text'));
    final bodyTextWidget = widgetTester.widget<Text>(bodyText);
    expect(bodyText, findsOneWidget);
    expect(bodyTextWidget.textAlign, TextAlign.justify);
  });
}
