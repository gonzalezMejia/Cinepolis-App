import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'quizzer.controller.dart';

class QuizzerPage extends GetView<QuizzerController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.navigationItems.length,
      child: Scaffold(
        bottomNavigationBar:
            GetPlatform.isIOS ? tabs(context, 80, 30) : tabs(context, 50, 0),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: controller.navigationItems.map((e) => e.page).toList(),
        ),
      ),
    );
  }

  Widget tabs(BuildContext context, double height, double padding) {
    return Container(
            height: height,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(bottom: 5),
            child: TabBar(
                indicatorColor: Theme.of(context).highlightColor,
                tabs: controller.navigationItems
                    .map((e) => new Tab(
                        icon: Icon(e.icon,
                            color: Theme.of(context).highlightColor)))
                    .toList()))
        .paddingOnly(bottom: padding);
  }
}
