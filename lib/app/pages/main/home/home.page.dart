import 'package:Cinepolis/app/pages/main/home/home.controller.dart';
import 'package:Cinepolis/app/pages/main/home/widgets/branches_list.widget.dart';
import 'package:Cinepolis/app/pages/main/home/widgets/news_item.widget.dart';
import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/app/widgets/progress/progress_liner.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('wr00ossssssssss');
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => MsgUtils.exit(
            context,
            "¿Seguro quieres cerrar la app?",
            () => SystemChannels.platform.invokeMethod('SystemNavigator.pop')),
        child: SafeArea(
          child: Obx(() {
            return controller.loading.value
                ? ProgressLinerPrymary()
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                        controller.news.length > 0
                            ? _listNewsWidget(context)
                            : Container(),
                        _listBranchesWidget(context).paddingOnly(bottom: 10)
                      ]);
          }),
        ),
      ),
    );
  }

  Widget _listNewsWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22, top: 10, bottom: 10),
          child: Text(
            "Noticias",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.news.length,
              clipBehavior: Clip.antiAlias,
              itemBuilder: (_, i) {
                return NewsItem(controller.news[i]);
              }),
        )
      ],
    );
  }

  Widget _listBranchesWidget(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(left: 20, right: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Asignación del día",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${controller.dateNow()}',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ).paddingOnly(top: 13, left: 13, right: 13, bottom: 3),
            Divider(
                thickness: 2,
                indent: 20,
                endIndent: 20,
                color: Colors.grey[600]!),
            controller.branchesVisited.length > 0
                ? Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.branchesVisited.length,
                        clipBehavior: Clip.antiAlias,
                        itemBuilder: (_, i) {
                          return BranchesList(controller.branchesVisited[i]);
                        }),
                  )
                : Center(
                        child: Text("NO CUENTAS CON SUCURSALES",
                            style: TextStyle(fontSize: 15)))
                    .paddingOnly(top: 13, bottom: 18)
          ],
        ));
  }
}
