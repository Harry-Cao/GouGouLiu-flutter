import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/extension/widget_extension.dart';
import 'package:gougouliu_flutter/main_container/home/model/home_post_model.dart';

class HomePostCell extends StatelessWidget {
  final HomePostModel postModel;
  final void Function() onTap;
  const HomePostCell({super.key, required this.postModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ink.image(
              image: CachedNetworkImageProvider(
                  postModel.post?.coverImageUrl ?? ""),
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
                              backgroundImage: CachedNetworkImageProvider(
                                  postModel.user?.avatarUrl ?? ""))
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
