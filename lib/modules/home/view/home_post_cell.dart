import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/extension/widget_extension.dart';
import 'package:gougouliu_flutter/modules/home/model/home_post_model.dart';

class HomePostCell extends StatelessWidget {
  final HomePostModel postModel;
  const HomePostCell({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => debugPrint(postModel.post?.title ?? ""),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ink.image(
              image: NetworkImage(postModel.post?.coverImageUrl ?? ""),
              fit: BoxFit.cover,
              child: Container(),
            ).size(height: Random().nextDouble() * 100 + 200),
            Semantics(
              container: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(postModel.post?.title ?? "").padding(bottom: 8),
                  Row(
                    children: [
                      CircleAvatar(
                              backgroundImage:
                                  NetworkImage(postModel.user?.avatarUrl ?? ""))
                          .size(width: 20, height: 20)
                          .padding(right: 6),
                      Text(
                        postModel.user?.userName ?? "",
                        style: const TextStyle(
                            color: Colors.blueGrey, fontSize: 12),
                      )
                    ],
                  ),
                ],
              ).padding(left: 12, top: 12, right: 12, bottom: 8),
            )
          ],
        ),
      ),
    );
  }
}
