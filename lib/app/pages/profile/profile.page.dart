import 'package:cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis/app/widgets/custom_container/custom_container.widget.dart';
import 'package:cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:cinepolis/core/values/enviroments.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              icon: const FaIcon(
                FontAwesomeIcons.signOutAlt,
                size: 24,
              ))
        ]),
        body: Obx(() {
          return controller.loading.value
              ? const Center(child: ProgressPrimary())
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        _imageContain(context).paddingOnly(top: 10),
                        _textPain(context, "Nombre",
                                controller.profile.first.nombreCompleto)
                            .paddingOnly(bottom: 15, top: 15),
                        _textPain(context, "Correo",
                                controller.profile.first.correoE)
                            .paddingOnly(bottom: 15),
                        _textPain(
                                context,
                                "Télefono",
                                controller.profile.first.telefono != 0
                                    ? controller.profile.first.telefono
                                        .toString()
                                    : 'Sin Teléfono')
                            .paddingOnly(bottom: 15),
                      ],
                    ),
                  ),
                );
        }));
  }

  Widget _imageContain(BuildContext context) {
    return Container(
        width: context.isLargeTablet ? 90 : 85,
        height: context.isLargeTablet ? 90 : 85,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(fit: BoxFit.scaleDown, image: _getImage())));
  }

  ImageProvider<Object> _getImage() {
    ImageProvider _imageDefault =
        const AssetImage('assets/images/user_default.jpg');
    var found = false;

    var _imageNetwork = NetworkImage(
        '${Environments.imageUrl}${controller.user.value.id != 0 ? controller.user.value.picture : 'profile.jpg'}');

    _imageNetwork.evict().then<void>((bool success) {
      if (success) {
        found = true;
      }
    });

    return found ? _imageNetwork : _imageDefault;
  }

  Widget _textPain(BuildContext context, String title, String text) {
    return CustomContainer(labelText: title, children: [
      Text(text, style: Theme.of(context).textTheme.subtitle1)
    ]).paddingOnly(left: 15, right: 15);
  }
}
