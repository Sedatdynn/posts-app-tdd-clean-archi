import 'dart:convert';

import 'package:core/utils/typedef.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts_data/src/model/post_model.dart';
import 'package:posts_domain/posts_domain.dart';

import '../helper/test_helpers.dart';

void main() {
  const testModel = PostModel.empty();

  test('[PostModel] should subclasses to [PostEntity]', () {
    expect(testModel, isA<PostEntity>());
  });

  final tJson = jsonHelper('posts');
  final tMap = jsonDecode(tJson) as DataMap;

  test('fromJson', () {
    //act
    final result = PostModel.fromJson(tMap);

    //assert
    expect(result, testModel);
  });

  test('toJson', () {
    //act
    final result = testModel.toJson();
    final testJson = {
      'userId': 1,
      'title': 'empty_title',
      'body': 'empty_body',
      'id': 1,
    };

    //assert
    expect(result, testJson);
  });

  test('copyWith', () {
    //act
    final result = testModel.copyWith(title: 'new title');

    //assert
    expect(result.title, equals('new title'));
  });

  test('equatable', () {
    //act
    const firstModel = PostModel(userId: 1, id: 1, title: 'title', body: 'body');
    const secondModel = PostModel(userId: 1, id: 1, title: 'title', body: 'body');
    const thirdModel = PostModel(userId: 2, id: 2, title: 'title', body: 'body');

    //assert
    expect(firstModel, equals(secondModel));
    expect(firstModel, isNot(equals(thirdModel)));
  });
}
