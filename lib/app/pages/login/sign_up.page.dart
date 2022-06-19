import 'package:cinepolis/app/pages/login/login.controller.dart';
import 'package:cinepolis/app/utils/msg.utils.dart';
import 'package:cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis/app/widgets/custom_button/custom_button_large.widget.dart';
import 'package:cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:cinepolis/core/values/enviroments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpPage extends GetView<LoginController> {
  const SignUpPage({Key? key}) : super(key: key);

  final String _imagesUrl = Environments.fileManagerViewUrl;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return WillPopScope(
        onWillPop: ()=>MsgUtils.exit(context, "¿Estas seguro que quieres salir, sin guardar?", () =>Get.back<SignUpPage>(closeOverlays: true,canPop: true)),
        child: Scaffold(
          appBar: SimpleAppBar(title: "Registro"),
          body: ReactiveForm(
            formGroup: controller.formUser.value,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: _photo(context),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _textForm("Nombre",'name',"Debes de ingresar al menos un Nombre",context),
                          _textForm("Aapellidos",'secondName',"Debes de ingresar al menos un apellido",context),
                        ],
                      ),
                    )
                  ],
                ),
                _textForm("Correo", "email", "Debes de ingresar un Correo", context).paddingOnly(right: 25,left: 25,top: 5),
                _textForm("Contraseña", "pass", "Debes de ingresar una contraseña", context).paddingOnly(right: 25,left: 25,top: 5),
                _textForm("Contraseña", "pass2", "Las contraseñas deben coincidir", context).paddingOnly(right: 25,left: 25,top: 5),
                _textForm("Télefono", "telephone", "Solo números", context).paddingOnly(right: 25,left: 25,top: 5),
                _customSliver(context),
                _customDrpDown(context),
                CustomButtonLarge(
                  text: "Guardar",
                  color: Colors.blue[900]!,
                  onPressed: () => controller.confirmSave(context),
                ).paddingOnly(top: 5)
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _textForm(String label, String formControl, String msgError, BuildContext context) {
    return ReactiveTextField(
      keyboardAppearance: Brightness.dark,
      formControlName: formControl,
      validationMessages: (control) => {'required': msgError},
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 12),
          labelStyle: const TextStyle(color: Colors.black26, fontSize: 12),
          labelText: label),
    ).paddingOnly(bottom: 10);
  }

  _photo(BuildContext context) {
    return Obx(() {
        return controller.imagesLoading.value ?
        const ProgressPrimary()
            :GestureDetector(
                  onTap: () => controller.onTakePhoto(context),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network('$_imagesUrl/${controller.photo.fileManagerName}',errorBuilder: (context, error, stackTrace) => Image.asset("assets/images/user_default.jpg"),
                        fit: BoxFit.cover,height: 100,width: 100),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Agregar foto'),
                          Icon(Icons.add, color: Colors.blue,)
                        ],
                      ).paddingAll(15).paddingOnly(top: 10),
                    ],
                  ),
                );
      });
  }

  _customSliver(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ingresa tu edad",style:Theme.of(context).textTheme.bodyText1),
          ReactiveSlider(formControlName: 'age',labelBuilder: (s)=>"edad: ${s.toInt()}",min: 0,max: 100,divisions: 100),
        ],
      ).paddingAll(10),
    ).paddingOnly(right: 15,left: 15);
  }

  _customDrpDown(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ingresa tu Genero",style:Theme.of(context).textTheme.bodyText1),
            ReactiveDropdownField(
                hint: const Text("Genero"),
                formControlName: "genero",
                items: const <DropdownMenuItem>[
                  DropdownMenuItem(child: Text("Masculino"),value: "M"),
                  DropdownMenuItem(child: Text("Femenino"),value: "F"),
                  DropdownMenuItem(child: Text("Indefinido"),value: "N"),
                ])
          ]
      ).paddingAll(10),
    ).paddingOnly(right: 15,left: 15);
  }


}