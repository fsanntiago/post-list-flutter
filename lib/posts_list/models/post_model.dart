// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostModel {
  int userId;
  int id;
  String title;
  String body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  static List<PostModel> fromJson(String source) {
    final parsedJson = json.decode(source) as Iterable<dynamic>;
    final postList = parsedJson
        .map(
          (item) => PostModel.fromMap(item as Map<String, dynamic>),
        )
        .toList();
    return postList;
  }
}
