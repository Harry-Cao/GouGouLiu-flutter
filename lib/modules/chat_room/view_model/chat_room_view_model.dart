import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/database/database.dart';
import 'package:gougouliu_flutter/database/extension/database_message.dart';
import 'package:gougouliu_flutter/main_container/message/model/message_model.dart';
import 'package:gougouliu_flutter/manager/user_manager/model/user_model.dart';
import 'package:gougouliu_flutter/manager/user_manager/user_manager.dart';

class ChatRoomViewModel extends ChangeNotifier {
  final MessageModel messageModel;
  ChatRoomViewModel(this.messageModel);

  final scrollController = ScrollController();
  var inputText = "";

  (ChatModel, UserModel?) getCellData(int index) {
    final chatModel = messageModel.messages[index];
    UserModel? user;
    if (chatModel.userId case String userId) {
      user = UserManager.shared.getUser(userId);
    }
    return (chatModel, user);
  }

  void scrollToBottom({bool animate = true}) {
    if (scrollController.hasClients) {
      if (animate) {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      } else {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    }
  }

  void onInputTextChanged(String text) {
    inputText = text;
  }

  void sendMessage() {
    final chatModel = ChatModel(
      DateTime.now(),
      ChatType.text.name,
      UserManager.current.userId,
      text: inputText,
    );
    DataBase.shared.addChatModel(chatModel, messageModel);
    inputText = "";
    notifyListeners();
    Future.delayed(const Duration(milliseconds: 100), () => scrollToBottom());
  }
}
