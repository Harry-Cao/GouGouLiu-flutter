import 'package:gougouliu_flutter/manager/user_manager/model/user_model.dart';

class HomePostModel {
  final UserModel? user;
  final PostModel? post;

  HomePostModel({required this.user, required this.post});

  factory HomePostModel.fromJson(Map<String, dynamic> json) {
    return HomePostModel(
      user: UserModel.fromJson(json['user']),
      post: PostModel.fromJson(json["post"]),
    );
  }
}

class PostModel {
  final String? postId;
  final String? userId;
  final String? coverImageUrl;
  final List<String>? photos;
  final String? title;
  final String? content;
  final String? createTime;
  final String? updateTime;

  PostModel(
      {required this.userId,
      required this.coverImageUrl,
      required this.photos,
      required this.title,
      required this.content,
      required this.createTime,
      required this.updateTime,
      required this.postId});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        userId: json['userId'],
        coverImageUrl: json['coverImageUrl'],
        photos: (json['photos'] as List).map((e) => e as String).toList(),
        title: json['title'],
        content: json['content'],
        createTime: json['createTime'],
        updateTime: json['updateTime'],
        postId: json['postId']);
  }
}
