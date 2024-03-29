import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_app/feature/posts/view/index.dart';
import 'package:posts_app/feature/posts/view/post_home_view.dart';

class MockGlobalBloc extends MockBloc<GlobalEvent, GlobalState> implements GlobalBloc {}

class MockPostBloc extends MockBloc<PostsEvent, PostsState> implements PostsBloc {}

void main() {
  late GlobalBloc mockGlobalBloc;
  late PostsBloc mockPostBloc;
  setUp(() {
    mockGlobalBloc = MockGlobalBloc();
    mockPostBloc = MockPostBloc();
    HttpOverrides.global = null;
  });

  Widget testableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => mockGlobalBloc,
        ),
        BlocProvider<PostsBloc>(
          create: (context) => mockPostBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('if No Connection should trigger the PostsErrorWidget', (widgetTester) async {
    //arrange
    when(() => mockGlobalBloc.state).thenReturn(
      const GlobalState(isConnected: false),
    );

    //act
    await widgetTester.pumpWidget(testableWidget(const PostsHomeView()));
    final errorWidget = find.byType(PostsErrorWidget);

    //assert
    expect(errorWidget, findsOneWidget);
  });
  testWidgets('if there is Connection should trigger the LoadingCircularWidget',
      (widgetTester) async {
    //arrange
    when(() => mockGlobalBloc.state).thenReturn(
      const GlobalState(isConnected: true),
    );
    when(() => mockPostBloc.state).thenReturn(
      const PostsState(
        posts: [],
        errorMessage: null,
        isLoading: true,
        isConnect: true,
        isPostCreated: false,
      ),
    );

    //act
    await widgetTester.pumpWidget(testableWidget(const PostsHomeView()));
    final loadingCircular = find.byType(CircularProgressIndicator);

    //assert
    expect(loadingCircular, findsOneWidget);
  });
  testWidgets('should show posts Lists when Posts getting from Api', (widgetTester) async {
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
    await widgetTester.pumpWidget(testableWidget(const PostsHomeView()));
    final postsList = find.byKey(const Key('posts_list'));
    final postsListTile = find.byType(ListTile);

    //assert
    expect(postsList, findsOneWidget);
    expect(postsListTile, findsOneWidget);
    await widgetTester.tap(postsListTile);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(seconds: 4));

    final postDetail = find.byKey(const Key('POST_DETAIL_VIEW'));
    expect(postDetail, findsOneWidget);
  });
}
