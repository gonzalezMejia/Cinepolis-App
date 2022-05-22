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
            .paddingAll(40),
        _user(controller.username.value, context),
        _password(controller.password.value, context)
            .paddingOnly(top: 16, bottom: 16),
        _containButton(context).paddingOnly(top: 25),
      ]).paddingOnly(top: 10, bottom: 50, left: 16, right: 16),
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
            color: Colors.blue,
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
        labelStyle: TextStyle(color: Theme.of(context).hoverColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hoverColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hoverColor),
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
        labelStyle: TextStyle(color: Theme.of(context).hoverColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hoverColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hoverColor),
        ),
      ),
    );
  }
}
