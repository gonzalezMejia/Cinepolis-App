import 'package:badges/badges.dart';
import 'package:cinepolis/data/models/core/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:cinepolis/app/utils/msg.utils.dart';
import 'package:get/get.dart';
import 'main.controller.dart';
import 'package:flutter/services.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.navigationItems.length,
      child: Scaffold(
          body: WillPopScope(
              onWillPop: () =>
                  MsgUtils.exit(
                      context,
                      "¿Seguro quieres cerrar la app?",
                          () =>
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop')),
              child: TabBarView(
                children:
                controller.navigationItems.map((e) => e.page).toList(),
              )),
          bottomNavigationBar: Container(
              height: 60,
              color: Theme
                  .of(context)
                  .primaryColorLight,
              padding: const EdgeInsets.only(bottom: 5),
              child: TabBar(
                  indicatorColor: Theme
                      .of(context)
                      .primaryColorDark,
                  tabs: controller.navigationItems
                      .map((e) =>
                      Tab(
                          icon: e.label == 'Carrito' ?
                          Obx(() {
                            return Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              visible: controller.count.value > 0,
                              replacement: _viewIcon(e),
                              child: Badge(
                                badgeContent: Text(
                                    controller.count.value.toString()),
                                child: _viewIcon(e),
                              ),
                            );
                          }) : _viewIcon(e)))
                      .toList()))),
    );
  }

  _viewIcon(TabItem e) {
    return Tooltip(
      message: e.label,
      child: Icon(
        e.icon,
      ),
    );
  }
}
