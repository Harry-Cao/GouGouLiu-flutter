import 'dart:async';
import 'package:gougouliu_flutter/main_container/message/model/message_model.dart';
import 'package:gougouliu_flutter/manager/user_manager/model/user_model.dart';
import 'package:realm/realm.dart';

class DataBase {
  static final shared = DataBase();
  final config = Configuration.local([
    ChatModel.schema,
    MessageModel.schema,
    UserModel.schema,
  ]);
  late Realm realm;

  final StreamController<UserModel> userStreamController =
      StreamController<UserModel>.broadcast();
  Stream<UserModel> get usersStream => userStreamController.stream;

  DataBase() {
    realm = Realm(config);
  }
}
