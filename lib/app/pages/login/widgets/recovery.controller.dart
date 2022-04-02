import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/data/services/users/users.contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoveryPasswordController extends GetxController {
  final IUserService _service;
  var email = TextEditingController();
  var loadingButton = false.obs;

  RecoveryPasswordController(this._service);

  send() async {
    loadingButton.value = true;

    if (email.text.isEmpty) {
      SnackUtils.error('Ingresa un correo electronico valido', 'Advertencia');
      return loadingButton.value = false;
    } else if (email.text.length <= 10) {
      SnackUtils.error('Ingresa un correo electronico valido', 'Advertencia');
      return loadingButton.value = false;
    } else {
      var approvedRestore;

      await _service
          .recoveryPassword(email.text)
          .then((value) => approvedRestore = value);

      if (approvedRestore) {
        Get.back();
        email.clear();
        SnackUtils.success("Se envio una contraseña temporal a su correo");
      } else {
        SnackUtils.error(
            "No se encontro el correo, intentalo mas tarde", "Advertencia");
      }
      loadingButton.value = false;
    }
  }
}
