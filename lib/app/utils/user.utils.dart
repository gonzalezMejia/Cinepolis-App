import 'dart:convert';

import 'package:Cinepolis/app/utils/storage.utils.dart';
import 'package:Cinepolis/core/values/globals.dart';
import 'package:Cinepolis/data/models/entities/employees/user.model.dart';

class UserUtils {
  static Future<User?> getCurrentUser() async {
    var userJson =
        await LocalStorageUtils.getStringByKey(Globals.CURRENT_USER_KEY);
    if (userJson.isEmpty) {
      return null;
    } else {
      return User.fromJson(json.decode(userJson));
    }
  }
}
