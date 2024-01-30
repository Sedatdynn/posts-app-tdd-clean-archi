import 'package:core/utils/typedef.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:posts_domain/posts_domain.dart';
part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends PostEntity {
  const PostModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.body,
  });
  const PostModel.empty() : this(id: 1, userId: 1, title: 'empty_title', body: 'empty_body');

  factory PostModel.fromJson(DataMap json) => _$PostModelFromJson(json);

  DataMap toJson() => _$PostModelToJson(this);

  @override
  PostModel copyWith({
    int? id,
    int? userId,
    String? title,
    String? body,
  }) {
    return PostModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
