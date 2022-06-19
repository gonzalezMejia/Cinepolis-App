import 'dart:async';
import 'package:cinepolis/app/pages/login/sign_up.page.dart';
import 'package:cinepolis/app/utils/images.utils.dart';
import 'package:cinepolis/app/utils/msg.utils.dart';
import 'package:cinepolis/core/routes/pages.dart';
import 'package:cinepolis/data/models/entities/dynamic/evidences.model.dart';
import 'package:cinepolis/data/models/entities/dynamic/file_manager.model.dart';
import 'package:cinepolis/data/models/entities/users/user.model.dart';
import 'package:cinepolis/data/services/auth/auth.contract.dart';
import 'package:cinepolis/data/services/filemanager/file_manager.contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginController extends GetxController {
  final IAuthService _service;
  final IFileManagerService _fileManagerService;


  var loginText = 'Ingresar'.obs;
  var duration = const Duration(seconds: 2);
  var rondButton = RoundedLoadingButtonController().obs;
  var photo= Evidences.fromVoid();

  final formUser = FormGroup({
    'name': FormControl<String>(validators: [Validators.required], value: ''),
    'secondName': FormControl<String>(validators: [Validators.required], value: ''),
    'email': FormControl<String>(validators: [Validators.email], value: ''),
    'pass': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
    ]),
    'pass2': FormControl<String>(),
    'genero': FormControl<String>(validators: [Validators.required], value: ''),
    'telephone': FormControl<String>(validators: [Validators.number], value: ''),
    'age': FormControl<int>(validators: [Validators.number], value: 10)
  },validators: [
      (AbstractControl<dynamic> control) {
  final form = control as FormGroup;

  final formControl = form.control('pass');
  final matchingFormControl = form.control('pass2');

  if (formControl.value != matchingFormControl.value) {
  matchingFormControl.setErrors({'Las contraseñas deben ser iguales': true});

  // force messages to show up as soon as possible
  matchingFormControl.markAsTouched();
  } else {
  matchingFormControl.removeError('Las contraseñas deben ser iguales');
  }

  return null;
  }
  ]).obs;

  var username = TextEditingController(text: '').obs;
  var password = TextEditingController(text: '').obs;

  var imagesLoading = false.obs;

  LoginController(this._service,this._fileManagerService);

  startTime() async {
    rondButton.value.start();
    return singIn();
  }

  singIn() async {
    var user = await _service.singIn(username.value.text, password.value.text);
    if (user.id == 0) {
      return rondButton.value.stop();
    } else {
      rondButton.value.success();
      return Timer(duration, () => Get.offAllNamed(Routes.main));
    }
  }

  @override
  void onClose() {
    super.onClose();
    rondButton.close();
  }

  onSignUp() => Get.to(()=>const SignUpPage(),transition: Transition.fadeIn);


  confirmSave(BuildContext context) {
    if (formUser.value.valid) {
      var model = User(
          id: 0,
          fAdmission: DateTime.now().toString(),
          photo: photo.fileManagerName,
          age: formUser.value.control('age').value,
          email: formUser.value.control('email').value,
          name: formUser.value.control('name').value,
          pass: formUser.value.control('pass2').value,
          genero: formUser.value.control('genero').value,
          secondName:formUser.value.control('secondName').value,
          telephone: double.tryParse(formUser.value.control('telephone').value)??0,
      );
      print(model.toJson());
      _service.singUp(model).then((value) {
        Get.back<SignUpPage>(closeOverlays: true,canPop: true);
        SnackUtils.success("Uusario Registrado con Exito");
        username.value.text=model.email!;
        password.value.text= model.pass!;
        startTime();
      }).onError((error, stackTrace) =>
        SnackUtils.error(error.toString(), "Advertencia")
      );
    } else {
      SnackUtils.error("${formUser.value.valid.reactive}", "Advertencia");
    }
  }

  onTakePhoto(BuildContext context) {
    ImageUtils.takeImage(context, _fileManagerService, onSelected: () {
      imagesLoading.value = true;
    }, onCompleted: _imageCallback);
  }

  _imageCallback(FileManager file) {
    String fileManagerName = '${file.name}${file.extension}'.trim();
    photo=Evidences(
        fileManagerId: file.id,
        fileManagerName: fileManagerName,
        id: file.id,
        fileManagerExtension: file.extension,
        fileManagerRealName: file.realName,
        mimeType: file.mimeType);
    imagesLoading.value = false;
  }
}
