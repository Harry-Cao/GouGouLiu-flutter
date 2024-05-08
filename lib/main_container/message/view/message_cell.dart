import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/extension/widget_extension.dart';
import 'package:gougouliu_flutter/main_container/message/model/message_model.dart';
import 'package:gougouliu_flutter/manager/user_manager/model/user_model.dart';

class MessageCell extends StatelessWidget {
  final MessageModel messageModel;
  final UserModel? user;
  final void Function() onTap;
  const MessageCell(
      {super.key,
      required this.messageModel,
      required this.user,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(user?.avatarUrl ??
                "http://192.168.0.211:88/GGLServer/media/global/defaultAvatar.png"),
          ).size(width: 48, height: 48),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.userName ?? "",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ).padding(bottom: 4),
                Text(
                  messageModel.displayText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ).padding(left: 2),
              ],
            ).padding(left: 8),
          ),
        ],
      ).padding(left: 12, right: 12, top: 16, bottom: 16),
    );
  }
}
