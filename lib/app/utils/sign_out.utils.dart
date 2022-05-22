import 'package:cinepolis/app/utils/storage.utils.dart';
import 'package:cinepolis/core/routes/pages.dart';
import 'package:cinepolis/core/values/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignOut {
  SignOut() {
    Get.offNamedUntil(Routes.login, ModalRoute.withName(Routes.login));
    LocalStorageUtils.setStringKey(Globals.currentUserKey, "");
    LocalStorageUtils.setStringKey(Globals.tokenKey, "");
  }
}
