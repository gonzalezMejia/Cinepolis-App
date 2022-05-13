import 'package:Cinepolis/app/pages/main/home/home.controller.dart';
import 'package:Cinepolis/app/pages/main/home/widgets/branches_list.widget.dart';
import 'package:Cinepolis/app/pages/main/home/widgets/news_item.widget.dart';
import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/app/widgets/progress/progress_liner.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
          height: MediaQuery.of(context).size.height * .2,
          color: Colors.white38),
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
                        //carrusel promociones
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 280.0,
                            disableCenter: true,
                            autoPlay: true,
                            viewportFraction: 0.9,
                            aspectRatio: 2.0,
                            enlargeCenterPage: false,
                            scrollDirection: Axis.horizontal,
                            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                            enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          ),
                          items: controller.promotions.map((i) {
                            return Container(
                                child: uploadImage(i.photo!),
                                height: 200,
                                margin: EdgeInsets.symmetric(
                                    vertical: 7.0, horizontal: 3.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: (Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.purple
                                        : Colors.brown[50])));
                          }).toList(),
                        ),
                        _listNewsWidget(context),
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
            "Peliculas",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.movies.length,
              clipBehavior: Clip.antiAlias,
              itemBuilder: (_, i) {
                return NewsItem(controller.movies[i]);
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

  //carrusel
  Widget uploadImage(String i) {
    return Image.network(i);
    itemCount:
    15;
    itemBuilder:
    (BuildContext context, int itemIndex, int pageViewIndex) => Container(
          child: Text(itemIndex.toString()),
        );
  }
}
