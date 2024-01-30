import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_data/src/data_source/post_remote_data_source_abstract.dart';

String jsonHelper(String fileName) => File('test/helper/$fileName.json').readAsStringSync();

class MockDio extends Mock implements Dio {}

class MockDataSource extends Mock implements PostsRemoteDataSource {}
