// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:cinepolis/app/pages/billboard/billboard.controller.dart';
import 'package:cinepolis/app/pages/main/home/widgets/news_item.widget.dart';
import 'package:cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:cinepolis/core/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillboardPage extends GetView<BillBoardController> {
  const BillboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppBar(title: "Cartelera"),
        body: Obx(() => controller.loading.value
            ? const Center(
                child: ProgressPrimary(),
              )
            : ListView(
                children: [_listNewsWidget(context).paddingOnly(top: 10)])));
  }

  Widget _listNewsWidget(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.movies.length,
        clipBehavior: Clip.antiAlias,
        itemBuilder: (_, i) {
          return NewsItem(controller.movies[i],
              () => Get.toNamed("${Routes.movieDetail}?model=${json.encode(controller.movies[i].toJson())}"));
        });
  }
}
