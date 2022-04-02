import 'package:Cinepolis/app/pages/main/main.controller.dart';
import 'package:Cinepolis/app/pages/main/main.page.dart';
import 'package:Cinepolis/app/widgets/app_bar/main/main_app_bar.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import 'menu_screen_drawer.widget.dart';

class MenuZoomDrawer extends GetView<MainController> {
  const MenuZoomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
          title: "Bienvenido",
          ontap: () => controller.actionDrawer(),
          widget: Container(),
        ),
        body: ZoomDrawer(
          backgroundColor: Theme.of(context).primaryColorLight,
          controller: controller.zoomDrawerController.value,
          style: DrawerStyle.Style1,
          menuScreen: const MenuScreenDrawer(),
          mainScreen: const MainPage(),
          borderRadius: 24.8,
          showShadow: true,
          angle: -12.0,
          slideWidth: MediaQuery.of(context).size.width *
              (ZoomDrawer(mainScreen: Container(), menuScreen: Container())
                      .isRtl
                  ? .45
                  : 0.65),
          openCurve: Curves.fastOutSlowIn,
          closeCurve: Curves.fastOutSlowIn,
        ));
  }
}
