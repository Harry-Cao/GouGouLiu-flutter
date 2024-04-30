import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/extension/widget_extension.dart';
import 'package:gougouliu_flutter/main_container/home/model/home_post_model.dart';

class PostPage extends StatelessWidget {
  final HomePostModel postModel;
  const PostPage({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    final browserHeight = 4032 / 3024 * MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageView.builder(
            itemCount: postModel.post?.photos?.length,
            itemBuilder: (context, index) {
              final photoUrl = postModel.post?.photos?[index];
              return InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: CachedNetworkImage(imageUrl: photoUrl ?? ""),
              );
            },
          ).size(height: browserHeight),
          Column(
            children: [
              Text(
                postModel.post?.title ?? "",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ).padding(bottom: 12),
              Text(
                postModel.post?.content ?? "",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ).padding(left: 16, top: 16, right: 16, bottom: 16),
        ],
      ),
    );
  }
}
