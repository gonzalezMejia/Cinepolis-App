import 'dart:convert';

import 'package:cinepolis/app/utils/storage.utils.dart';
import 'package:cinepolis/core/values/globals.dart';
import 'package:cinepolis/data/models/entities/users/user.model.dart';

class UserUtils {
  static Future<User?> getCurrentUser() async {
    var userJson =
        await LocalStorageUtils.getStringByKey(Globals.currentUserKey);
    if (userJson.isEmpty) {
      return null;
    } else {
      return User.fromJson(json.decode(userJson));
    }
  }
}
