import 'package:cinepolis/app/pages/billboard/detail/movie_detail.controller.dart';
import 'package:cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis/app/widgets/custom_button/chip.widget.dart';
import 'package:cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';

class MovieDetailDetailPage extends GetView<MovieDetailController> {
  const MovieDetailDetailPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.deleteProcess(),
      child: Obx(() {
        return Scaffold(
          appBar: SimpleAppBar(title: "Detalle"),
          body: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _imageContain(context, controller.movie.value.photo!),
                Center(
                    child: _title(context, controller.movie.value.nombre!)
                        .paddingOnly(left: 10, right: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _card(context, controller.movie.value.clasificacion!,
                        color: Colors.grey),
                    _card(context, '${controller.movie.value.duracion!} min',
                        color: Colors.black),
                    _card(context, controller.movie.value.categorias!,
                        color: Colors.blue[900]!),
                  ],
                ).paddingOnly(top: 8, bottom: 15),
                _subtitle(
                    context, 'Trailer', color: Colors.blue[900]!, size: 2.3)
                    .paddingOnly(bottom: 10, left: 8),
                _video(context).paddingOnly(bottom: 20),
                _subtitle(
                    context, 'Horarios', color: Colors.blue[900]!, size: 2.3).paddingOnly(left: 8),
                _getMovieTimes(),
                _subtitle(context, 'Sinopsis',
                    color: Colors.blue[900]!, size: 2.3)
                    .paddingOnly(bottom: 10, left: 8),
                _subtitle(context, controller.movie.value.sinopsis!,
                    color: Colors.grey)
                    .paddingOnly(bottom: 20, left: 8, right: 8),
                _subtitle(context, 'Creditos y Reparto',
                    color: Colors.blue[900]!, size: 1.5)
                    .paddingOnly(bottom: 10, left: 8),
                Row(
                  children: [
                    _subtitle(context, 'Actores', color: Colors.grey[700]!)
                        .paddingOnly(bottom: 15, left: 8, right: 8),
                    Flexible(
                      child:
                      _subtitle(context, controller.movie.value.actores!,
                          color: Colors.grey)
                          .paddingOnly(bottom: 15, left: 5, right: 8),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _subtitle(context, 'Directores', color: Colors.grey[700]!)
                        .paddingOnly(bottom: 15, left: 8, right: 8),
                    Flexible(
                      child: _subtitle(context,
                          controller.movie.value.directores!,
                          color: Colors.grey)
                          .paddingOnly(bottom: 15, left: 5, right: 8),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        );
      }),
    );
  }

  Widget _imageContain(BuildContext context, String url) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Image.network(url,
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 200,
            fit: BoxFit.cover))
        .paddingAll(5);
  }

  Widget _video(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.27,
      child: Obx(() =>
      controller.loadingVideo.value &&
          controller.chewieController.value.videoPlayerController.value
              .isInitialized
          ? const Center(child: ProgressPrimary())
          : Chewie(controller: controller.chewieController.value)),
    );
  }

  Widget _card(BuildContext context, String text, {Color color = Colors.blue}) {
    return Card(
      color: color,
      child: _subtitle(context, text).marginAll(5),
    );
  }

  Widget _title(BuildContext context, String text) {
    return Text(
      text,
      style: Theme
          .of(context)
          .textTheme
          .headline2!
          .apply(color: Colors.blue[900], fontWeightDelta: 2),
      overflow: TextOverflow.visible,
      maxLines: 3,
      softWrap: true,
      textAlign: TextAlign.center,
      textWidthBasis: TextWidthBasis.parent,
    );
  }

  Widget _subtitle(BuildContext context, String text,
      {Color color = Colors.white, double size = 0}) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: Theme
          .of(context)
          .textTheme
          .bodyText1!
          .apply(color: color, fontSizeDelta: size),
      overflow: TextOverflow.visible,
      maxLines: 10,
      softWrap: true,
      textWidthBasis: TextWidthBasis.parent,
    );
  }

  _getMovieTimes() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.availableLocations.length,
      itemBuilder: (BuildContext context, int index) =>
         ChipItem(
          controller.availableLocations[index].inicia!,
              () =>controller.onSelectSeat(controller.availableLocations[index]))
    ).paddingOnly(left: 15,top: 15,bottom: 15);
  }


}
