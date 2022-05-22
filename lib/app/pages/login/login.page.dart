import 'package:cinepolis/app/widgets/custom_button/custom_loading_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(physics: const BouncingScrollPhysics(), children: <Widget>[
        Center(child: Image.asset('assets/images/cinepolis.png'))
            .paddingOnly(top: 40, bottom: 17),
        Center(child: title(context)).paddingOnly(bottom: 23),
        _user(controller.username.value, context),
        _password(controller.password.value, context)
            .paddingOnly(top: 20, bottom: 30),
        _containButton(context),
      ]).paddingOnly(top: 10, left: 16, right: 16),
    );
  }

  Widget _containButton(BuildContext context) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(left: 40, right: 40),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          border: Border.all(
            style: BorderStyle.solid,
            color: Colors.white,
            width: 1.5,
          ),
        ),
        child: CustomLoadingButton(
            btnController: controller.rondButton.value,
            text: '${controller.loginText}',
            color: Theme.of(context).indicatorColor,
            onPressed: () => controller.startTime()),
      );
    });
  }

  TextField _user(TextEditingController controller, BuildContext context) {
    return TextField(
      obscureText: false,
      controller: controller,
      cursorColor: Theme.of(context).hoverColor,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: "Usuario",
        labelStyle: TextStyle(color: Theme.of(context).primaryColorLight),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColorLight),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[900]!, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  TextField _password(TextEditingController controller, BuildContext context) {
    return TextField(
      obscureText: true,
      controller: controller,
      onSubmitted: (s) => this.controller.startTime(),
      cursorColor: Theme.of(context).hoverColor,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: "Contraseña",
        labelStyle: TextStyle(color: Theme.of(context).primaryColorLight),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColorLight),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[900]!, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Text title(BuildContext context) {
    return Text(
      "LA MAGIA DEL CINE EN TUS MANOS",
      softWrap: true,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headline2!
          .apply(fontWeightDelta: 1, color: Theme.of(context).indicatorColor),
    );
  }
}
