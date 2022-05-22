import 'package:cinepolis/app/pages/billboard/billboard.controller.dart';
import 'package:cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:cinepolis/data/models/entities/movies/movies.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';

class BillBoardDetailPage extends GetView<BillBoardController> {
  const BillBoardDetailPage(this.model, {Key? key}) : super(key: key);

  final MoviesModel model;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.deleteProcess(),
      child: Scaffold(
        appBar: SimpleAppBar(title: "Detalle"),
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageContain(context, model.photo!),
              Center(
                  child: _title(context, model.nombre!)
                      .paddingOnly(left: 10, right: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _card(context, model.clasificacion!, color: Colors.grey),
                  _card(context, '${model.duracion!} min', color: Colors.black),
                  _card(context, model.categorias!, color: Colors.blue[900]!),
                ],
              ).paddingOnly(top: 8, bottom: 15),
              _subtitle(context, 'Trailer', color: Colors.blue[900]!, size: 2.3)
                  .paddingOnly(bottom: 10, left: 8),
              _video(context).paddingOnly(bottom: 20),
              _subtitle(context, 'Sinopsis',
                      color: Colors.blue[900]!, size: 2.3)
                  .paddingOnly(bottom: 10, left: 8),
              _subtitle(context, model.sinopsis!, color: Colors.grey)
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
                        _subtitle(context, model.actores!, color: Colors.grey)
                            .paddingOnly(bottom: 15, left: 5, right: 8),
                  ),
                ],
              ),
              Row(
                children: [
                  _subtitle(context, 'Directores', color: Colors.grey[700]!)
                      .paddingOnly(bottom: 15, left: 8, right: 8),
                  Flexible(
                    child: _subtitle(context, model.directores!,
                            color: Colors.grey)
                        .paddingOnly(bottom: 15, left: 5, right: 8),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _imageContain(BuildContext context, String url) {
    return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.network(url,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover))
        .paddingAll(5);
  }

  Widget _video(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.27,
      child: Obx(() => controller.loadingVideo.value &&
              controller.chewieController.value.videoPlayerController.value
                  .isInitialized
          ? Chewie(controller: controller.chewieController.value)
          : const Center(child: ProgressPrimary())),
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
      style: Theme.of(context)
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
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .apply(color: color, fontSizeDelta: size),
      overflow: TextOverflow.visible,
      maxLines: 10,
      softWrap: true,
      textWidthBasis: TextWidthBasis.parent,
    );
  }
}
