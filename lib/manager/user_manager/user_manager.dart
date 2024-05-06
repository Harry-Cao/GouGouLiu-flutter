import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/database/database.dart';
import 'package:gougouliu_flutter/database/extension/database_user.dart';
import 'package:gougouliu_flutter/manager/user_manager/model/user_model.dart';
import 'package:gougouliu_flutter/manager/user_manager/network_helper/user_network_helper.dart';

class UserManager {
  static final shared = UserManager();
  final networkHelper = UserNetworkHelper();
}

extension Request on UserManager {
  UserModel getUser(String userId) {
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
      debugPrint(user.userName);
      DataBase.shared.saveOrUpdateUser(user);
    }
  }
}
