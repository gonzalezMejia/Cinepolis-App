import 'dart:convert';
import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/data/models/entities/files/file_manager.model.dart';
import 'package:Cinepolis/data/services/filemanager/file_manager.contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageUtils {
  static Future<void> takeImage(
      BuildContext context, IFileManagerService service,
      {Function? onSelected, Function? onCompleted}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Selecciona una opción"),
            titleTextStyle: Theme.of(context).textTheme.bodyText1,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Theme.of(context).primaryColor,
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text('Galeria'),
                            onPressed: () => _getImage(
                                context,
                                ImageSource.gallery,
                                service,
                                onSelected,
                                onCompleted)),
                        TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Theme.of(context).primaryColor,
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text('Camara'),
                            onPressed: () => _getImage(
                                context,
                                ImageSource.camera,
                                service,
                                onSelected,
                                onCompleted))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static void _getImage(
      BuildContext context,
      ImageSource imageSource,
      IFileManagerService service,
      Function? onSelected,
      Function? onCompleted) async {
    final pickedField = await ImagePicker().pickImage(
        preferredCameraDevice: CameraDevice.rear,
        maxHeight: MediaQuery.of(context).size.height * 0.65,
        source: imageSource,
        imageQuality: 100);
    Get.back();
    if (pickedField == null) {
      return;
    }

    if (onSelected != null) onSelected();

    service
        .uploadPicture(pickedField.path)
        .onError((error, stackTrace) => MsgUtils.error(error.toString()))
        .then((value) {
      String responseJson = jsonEncode(value);
      Map<String, dynamic> map = jsonDecode(responseJson);
      var fileManagerResponse = new FileManager.fromJson(map);

      if (onCompleted != null) onCompleted(fileManagerResponse);
    });
  }
}
