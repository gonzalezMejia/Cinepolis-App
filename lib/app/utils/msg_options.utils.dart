import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class MsgOptions {
  static customWidget(
      BuildContext context, String title, List<Widget> widgets) async {
    final result = await showDialog(
        context: context,
        barrierDismissible: false,
        useSafeArea: true,
        builder: (builder) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                IconButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    icon: const Icon(Icons.close))
              ],
            ),
            actions: widgets,
            actionsOverflowButtonSpacing: 15,
            actionsOverflowDirection: VerticalDirection.down,
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actionsPadding: const EdgeInsets.only(left: 1, right: 1),
          );
        });
    return result;
  }

  static customImage(BuildContext context, String url,
      {String tag = ""}) async {
    try {
      final result = await Get.dialog(
        Dialog(
          backgroundColor: Colors.transparent,
          alignment: Alignment.center,
          child: SizedBox(
              height: 280,
              child: PhotoView(
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 2,
                  imageProvider: NetworkImage(url),
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                        "assets/images/404_NotFound.jpeg"); //do something
                  },
                  loadingBuilder: (context, event) => Hero(
                      tag: 'image$tag',
                      child: Image.asset("assets/images/loading.gif")),
                  heroAttributes: PhotoViewHeroAttributes(tag: "tagItem$tag"),
                  initialScale: PhotoViewComputedScale.contained,
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  enableRotation: false)),
        ),
        barrierDismissible: true,
        barrierColor: Colors.black38,
      );
      return result;
    } catch (e) {
      throw e.toString();
    }
  }

  showMessage(BuildContext context,
      {required GestureTapCallback onPressedGallery,
      required GestureTapCallback onPressedCamera}) {
    Get.defaultDialog(title: "Selecciona una opción", actions: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _optionText(context, "Galeria", onPressedGallery),
          _optionText(context, "Cámara", onPressedCamera),
          const Padding(padding: EdgeInsets.all(8)),
        ],
      )
    ]);
  }

  ElevatedButton _optionText(
      BuildContext context, String text, GestureTapCallback onPressed) {
    return ElevatedButton(
        onPressed: () => onPressed,
        child: Text(
          text,
          style: Theme.of(context).primaryTextTheme.subtitle1,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black)));
  }
}
