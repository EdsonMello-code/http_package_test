import 'dart:convert';

class PostModel {
  final String title;

  PostModel({required this.title});

  static fromJson(String json) => jsonDecode(json);

  factory PostModel.fromMap(map) => PostModel(title: map['title']);
}
