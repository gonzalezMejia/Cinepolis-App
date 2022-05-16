import 'package:Cinepolis/app/pages/main/home/home.controller.dart';
import 'package:Cinepolis/app/pages/main/home/widgets/news_item.widget.dart';
import 'package:Cinepolis/app/utils/msg_options.utils.dart';
import 'package:Cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>controller.loading.value
        ? ProgressPrimary()
        :CustomScrollView(
      shrinkWrap: true,
        slivers: [//static widgets
          _getPromotions(context),
          SliverList(
              delegate: SliverChildListDelegate([
                _listNewsWidget(context),
                ])
          )
        ])
    );
  }

  Widget _getPromotions(BuildContext context){
    return ExtendedSliverAppbar(
      isOpacityFadeWithTitle: false,
      background: Container(
        color: Theme.of(context).primaryColor,
        child: CarouselSlider(
          options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            height: MediaQuery.of(context).size.height*.33,
            disableCenter: true,
            autoPlay: true,
            viewportFraction: 0.8,
            aspectRatio: 2.0,
            pageSnapping: true,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            autoPlayCurve: Curves.easeOutQuart,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
          ),
          items: controller.promotions.map((i) => uploadImage(i.photo!,context)).toList(),
        ),
      ),
    );
  }

  Widget _listNewsWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 22, top: 20),
          child: Text(
            "Cartelera",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.movies.length,
            clipBehavior: Clip.antiAlias,
            itemBuilder: (_, i) {
              return NewsItem(controller.movies[i]);
            })
      ],
    );
  }

  //carrusel
  Widget uploadImage(String i,BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      borderOnForeground: false,
      child: Hero(
        tag: 'image$i',
        child: GestureDetector(
            onTap: ()=>MsgOptions.customImage(
                context, i),
            child: Image.network(i,fit: BoxFit.fill)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 3.0),
    );
  }
}
