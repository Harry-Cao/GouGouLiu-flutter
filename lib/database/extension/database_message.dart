import 'package:gougouliu_flutter/main_container/message/model/message_model.dart';
import 'package:gougouliu_flutter/database/database.dart';
import 'package:realm/realm.dart';

extension MessageExtension on DataBase {
  RealmResults<MessageModel> fetchAllMessages() {
    return realm.all<MessageModel>();
  }

  MessageModel? fetchMessageModel(String ownerId, String userId) {
    final results = realm.query<MessageModel>(
        "ownerId == \$0 AND userId == \$1", [ownerId, userId]).toList();
    if (results case [MessageModel messageModel, ...]) {
      return messageModel;
    }
    return null;
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
