import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/extension/widget_extension.dart';
import 'package:gougouliu_flutter/main_container/message/model/message_model.dart';
import 'package:gougouliu_flutter/manager/user_manager/model/user_model.dart';
import 'package:gougouliu_flutter/manager/user_manager/user_manager.dart';

class ChatRoomCell extends StatelessWidget {
  final ChatModel chatModel;
  final UserModel? user;
  const ChatRoomCell({super.key, required this.chatModel, required this.user});

  bool isSelf() {
    return user?.userId == UserManager.current.userId;
  }

  List<Widget> components() {
    final cpos = [
      CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(user?.avatarUrl ??
            "http://192.168.0.211:88/GGLServer/media/global/defaultAvatar.png"),
      ).size(width: 48, height: 48),
      Flexible(
        child: Card(
          child: Text(
            chatModel.text ?? "",
            style: const TextStyle(fontSize: 16),
          ).padding(left: 12, right: 12, top: 8, bottom: 8),
        ).padding(left: 8, right: 8),
      )
    ];
    return isSelf() ? cpos.reversed.toList() : cpos;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSelf() ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: components(),
    ).padding(left: 12, right: 12, top: 12, bottom: 12);
  }
}
