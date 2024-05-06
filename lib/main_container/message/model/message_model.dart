import 'package:realm/realm.dart';
part 'message_model.realm.dart';

@RealmModel()
class _ChatModel {
  late DateTime? createTime;
  late String? typeString;
  ChatType get type => ChatType.values.byName(typeString ?? ChatType.text.name);
  set type(ChatType type) {
    typeString = type.name;
  }

  late String? userId;
  late String? text;
  late String? photoUrl;
}

@RealmModel()
class _MessageModel {
  late DateTime? createTime;
  late String? ownerId;
  late String? userId;
  List<_ChatModel> messages = [];
  int unReadNum = 0;

  String get displayText {
    if (messages case [..., ChatModel lastMessage]) {
      switch (lastMessage.type) {
        case ChatType.text:
          return lastMessage.text ?? "";
        case ChatType.photo:
          return "[图片]";
      }
    }
    return "";
  }
}

enum ChatType {
  text,
  photo,
}
