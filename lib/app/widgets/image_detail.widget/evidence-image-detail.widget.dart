import 'package:cinepolis/core/values/enviroments.dart';
import 'package:cinepolis/data/models/entities/dynamic/evidences.model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetail extends StatelessWidget {
  final Evidences evidence;
  final bool isRemovable;
  static const String imagesUrl = Environments.fileManagerViewUrl;
  final GestureTapCallback onDelete;

  const ImageDetail(
      {Key? key,
      required this.evidence,
      required this.onDelete,
      this.isRemovable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Future.value(true);
        },
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              centerTitle: false,
              actions: [
                !isRemovable
                    ? const Text("")
                    : IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: onDelete),
              ],
            ),
            body: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(30),
                child: PhotoView(
                    minScale: PhotoViewComputedScale.contained * 0.8,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    imageProvider:
                        NetworkImage('$imagesUrl/${evidence.fileManagerName}'),
                    loadingBuilder: (context, event) {
                      return Image.asset("assets/images/loading.gif");
                    },
                    initialScale: PhotoViewComputedScale.contained * 0.8,
                    heroAttributes: PhotoViewHeroAttributes(
                        tag: "image$imagesUrl/${evidence.fileManagerName}"),
                    backgroundDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Theme.of(context).canvasColor,
                    ),
                    enableRotation: true))));
  }
}
