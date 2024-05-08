import 'package:gougouliu_flutter/database/database.dart';
import 'package:gougouliu_flutter/database/extension/database_user.dart';
import 'package:gougouliu_flutter/manager/user_manager/model/system_user_model.dart';
import 'package:gougouliu_flutter/manager/user_manager/model/user_model.dart';
import 'package:gougouliu_flutter/manager/user_manager/network_helper/user_network_helper.dart';

class UserManager {
  static final shared = UserManager();
  final networkHelper = UserNetworkHelper();
  static final current = UserModel("17137323356473014",
      userName: "Hh",
      avatarUrl:
          "http://f3.ttkt.cc:12873/GGLServer/media/preview/17141216215260892.JPEG");
}

extension Request on UserManager {
  UserModel getUser(String userId) {
    if (SystemUserModel.fromUserId(userId) case SystemUserModel user) {
      return UserModel(user.userId,
          userName: user.userName, avatarUrl: user.avatarUrl);
    }
    if (DataBase.shared.fetchUser(userId) case UserModel user) {
      return user;
    }
    UserModel newUser = UserModel(userId);
    DataBase.shared.addUser(newUser);
    _fetchAndSaveUser(userId);
    return newUser;
  }

  Future<void> _fetchAndSaveUser(String userId) async {
    if (await networkHelper.fetchUser(userId) case UserModel user) {
      DataBase.shared.saveOrUpdateUser(user);
    }
  }
}
