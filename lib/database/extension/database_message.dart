import 'package:gougouliu_flutter/main_container/message/model/message_model.dart';
import 'package:gougouliu_flutter/database/database.dart';
import 'package:realm/realm.dart';

extension MessageExtension on DataBase {
  RealmResults<MessageModel> fetchAllMessages() {
    return realm.all<MessageModel>();
  }

  void addMessage(MessageModel message) {
    realm.write(() => realm.add(message));
  }

  void deleteMessage(MessageModel message) {
    realm.write(() => realm.delete(message));
  }

  void addChatModel(ChatModel chatModel, MessageModel toMessageModel) {
    realm.write(() => toMessageModel.messages.add(chatModel));
  }
}
