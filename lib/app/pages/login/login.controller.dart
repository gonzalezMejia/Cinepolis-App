import 'dart:async';
import 'package:Cinepolis/core/routes/pages.dart';
import 'package:Cinepolis/data/services/auth/auth.contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginController extends GetxController {
  late IAuthService _service;

  var loginText = 'Ingresar'.obs;
  var duration = Duration(seconds: 2);
  var rondButton = RoundedLoadingButtonController().obs;

  //var username = TextEditingController(text: 'ediaz@esperanza.mx'); // SUPERVISOR
  // var username = TextEditingController(text: 'jcarballido@sethemba.mx'); // EMPLEADO 201
  //var username = TextEditingController(text: 'orocha@esperanza.mx'); // GERENTE 601
  var username = TextEditingController(text: '').obs;
  var password = TextEditingController(text: '').obs;

  LoginController(this._service);

  startTime() async {
    rondButton.value.start();
    return singIn();
  }

  singIn() async {
    var user = await _service.singIn(username.value.text, password.value.text);
    if (user == null)
      return rondButton.value.stop();
    else {
      rondButton.value.success();
      return Timer(duration, () => Get.offAllNamed(Routes.MAIN));
    }
  }

  @override
  void onClose() {
    super.onClose();
    rondButton.close();
  }
}
