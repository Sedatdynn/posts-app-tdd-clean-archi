import 'package:bloc_test/bloc_test.dart';
import 'package:posts_app/feature/posts/bloc/bloc/posts_bloc.dart';
import 'package:posts_app/product/global/bloc/global_bloc.dart';

class MockGlobalBloc extends MockBloc<GlobalEvent, GlobalState> implements GlobalBloc {}

class MockPostBloc extends MockBloc<PostsEvent, PostsState> implements PostsBloc {}
