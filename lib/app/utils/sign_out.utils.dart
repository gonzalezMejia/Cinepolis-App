import 'package:Cinepolis/app/utils/storage.utils.dart';
import 'package:Cinepolis/core/routes/pages.dart';
import 'package:Cinepolis/core/values/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignOut{
  SignOut() {
    Get.offNamedUntil(Routes.LOGIN, ModalRoute.withName(Routes.LOGIN));
    LocalStorageUtils.setStringKey(Globals.CURRENT_USER_KEY, "");
    LocalStorageUtils.setStringKey(Globals.TOKEN_KEY, "");
  }
}