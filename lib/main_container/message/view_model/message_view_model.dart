import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/database/extension/database_message.dart';
import 'package:gougouliu_flutter/database/database.dart';
import 'package:gougouliu_flutter/main_container/message/model/message_model.dart';
import 'package:gougouliu_flutter/manager/user_manager/model/system_user_model.dart';
import 'package:gougouliu_flutter/manager/user_manager/model/user_model.dart';
import 'package:gougouliu_flutter/manager/user_manager/user_manager.dart';
import 'package:realm/realm.dart';

class MessageViewModel extends ChangeNotifier {
  RealmResults<MessageModel> allMessages = DataBase.shared.fetchAllMessages();

  MessageViewModel() {
    _subscribe();
    _setupSystemMessages(UserManager.current.userId);
  }

  void _subscribe() {
    allMessages.changes.listen((_) => notifyListeners());
    DataBase.shared.usersStream.listen((_) => notifyListeners());
  }

  (MessageModel, UserModel?) getCellData(int index) {
    final messageModel = allMessages[index];
    UserModel? user;
    if (messageModel.userId case String userId) {
      user = UserManager.shared.getUser(userId);
    }
    return (messageModel, user);
  }

  void _setupSystemMessages(String userId) {
    const customerService = SystemUserModel.customerService;
    if (DataBase.shared.fetchMessageModel(userId, customerService.userId)
        case null) {
      final newMessageModel = MessageModel(
          createTime: DateTime.now(),
          ownerId: userId,
          userId: customerService.userId);
      DataBase.shared.addMessage(newMessageModel);
      DataBase.shared.addChatModel(
          ChatModel(DateTime.now(), ChatType.text.name, customerService.userId,
              text: customerService.welcomeWords),
          newMessageModel);
    }
  }
}
