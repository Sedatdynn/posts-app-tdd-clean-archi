import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  const PostEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  const PostEntity.empty() : this(id: 1, userId: 1, title: 'empty_title', body: 'empty_body');

  final int? id;
  final int? userId;
  final String? title;
  final String? body;
  @override
  List<Object?> get props => [id, userId, title, body];

  PostEntity copyWith({
    int? id,
    int? userId,
    String? title,
    String? body,
  }) {
    return PostEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
