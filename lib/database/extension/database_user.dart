import 'package:gougouliu_flutter/database/database.dart';
import 'package:gougouliu_flutter/manager/user_manager/model/user_model.dart';

extension User on DataBase {
  UserModel? fetchUser(String? userId) {
    return realm.find<UserModel>(userId);
  }

  void addUser(UserModel user) {
    realm.write(() => realm.add(user));
  }

  void saveOrUpdateUser(UserModel newValue) {
    if (realm.find<UserModel>(newValue.userId) case UserModel user) {
      realm.write(() {
        user.userName = newValue.userName;
        user.avatarUrl = newValue.avatarUrl;
      });
    } else {
      addUser(newValue);
    }
    userStreamController.add(newValue);
  }
}
