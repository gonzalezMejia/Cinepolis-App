import 'package:cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis/app/widgets/custom_container/custom_container.widget.dart';
import 'package:cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile.controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppBar(title: "Mi Perfil", actions: [
          IconButton(
              onPressed: () => controller.singOut(),
              icon: const Icon(Icons.exit_to_app))
        ]),
        body: Obx(() {
          return controller.loading.value
              ? const Center(child: ProgressPrimary())
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        _textPain(context, "Nombre",
                                controller.profile.first.nombreCompleto)
                            .paddingOnly(bottom: 15, top: 15),
                        _textPain(
                                context,
                                "Télefono",
                                controller.profile.first.telefono != 0
                                    ? controller.profile.first.telefono
                                        .toString()
                                    : 'Sin Teléfono')
                            .paddingOnly(bottom: 15),
                        _textPain(context, "Correo",
                                controller.profile.first.correoE)
                            .paddingOnly(bottom: 15)
                      ],
                    ),
                  ),
                );
        }));
  }

  Widget _textPain(BuildContext context, String title, String text) {
    return CustomContainer(labelText: title, children: [
      Text(text, style: Theme.of(context).textTheme.subtitle1)
    ]).paddingAll(15);
  }
}
