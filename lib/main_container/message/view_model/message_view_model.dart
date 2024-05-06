import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/database/extension/database_message.dart';
import 'package:gougouliu_flutter/database/database.dart';
import 'package:gougouliu_flutter/main_container/message/model/message_model.dart';
import 'package:gougouliu_flutter/manager/user_manager/model/user_model.dart';
import 'package:gougouliu_flutter/manager/user_manager/user_manager.dart';
import 'package:realm/realm.dart';

class MessageViewModel extends ChangeNotifier {
  RealmResults<MessageModel> allMessages = DataBase.shared.fetchAllMessages();

  MessageViewModel() {
    _subscribe();
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
}
