import 'package:realm/realm.dart';
part 'user_model.realm.dart';

@RealmModel()
class _UserModel {
  @PrimaryKey()
  late String userId;

  late String? userName;
  late String? avatarUrl;
}
