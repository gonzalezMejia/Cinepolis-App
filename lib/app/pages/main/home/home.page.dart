
import 'package:cinepolis/app/pages/billboard/billboard.controller.dart';
import 'package:cinepolis/app/pages/main/home/home.controller.dart';
import 'package:cinepolis/app/pages/main/home/widgets/news_item.widget.dart';
import 'package:cinepolis/app/utils/msg_options.utils.dart';
import 'package:cinepolis/app/widgets/progress/progress.widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loading.value
        ? const ProgressPrimary()
        : SafeArea(
            child: CustomScrollView(shrinkWrap: true, slivers: [
              //static widgets
             // _getPromotions(context),

              SliverList(
                  delegate: SliverChildListDelegate([
                _listNewsWidget(context),
              ]))
            ]),
          ));
  }

  /*Widget _getPromotions(BuildContext context) {
    return ExtendedSliverAppbar(
      leading: null,
      title: Center(
        child: Text(
          'CINEPOLIS',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      actions: Badge(
        badgeContent: Text(controller.count.value.toString()),
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(8),
          child: IconButton(icon: const Icon(Icons.shopping_cart_outlined),onPressed: (){})).paddingOnly(top: 5,right: 5),
      crossAxisAlignment: CrossAxisAlignment.center,
      isOpacityFadeWithTitle: true,
      background: Container(
        color: Colors.white,
        child: CarouselSlider(
          options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            height: MediaQuery.of(context).size.height * 0.26,
            disableCenter: true,
            autoPlay: true,
            viewportFraction: 0.75,
            pageSnapping: true,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            autoPlayCurve: Curves.easeOutQuart,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
          ),
          items: controller.promotions
              .map((i) => uploadImage(i.photo!, context))
              .toList(),
        ),
      ),
    );
  }*/

  Widget _listNewsWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 20),
          child: Text(
            "Cartelera",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .apply(fontWeightDelta: 2),
          ).paddingOnly(bottom: 10),
        ),
        ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.movies.length,
            clipBehavior: Clip.antiAlias,
            itemBuilder: (_, i) {
              return NewsItem(
                  controller.movies[i],
                  () => Get.find<BillBoardController>()
                      .goDetailMovie(controller.movies[i]));
            })
      ],
    );
  }

  //carrusel
  Widget uploadImage(String i, BuildContext context) {
    return Card(
      color: Colors.blue[900],
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue[400]!, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      semanticContainer: true,
      clipBehavior: Clip.hardEdge,
      child: Hero(
        tag: 'image$i',
        child: GestureDetector(
            onTap: () => MsgOptions.customImage(context, i),
            child: Image.network(i, fit: BoxFit.fill)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 3.0),
    );
  }
}
