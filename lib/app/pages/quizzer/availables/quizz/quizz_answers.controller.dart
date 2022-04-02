import 'package:Cinepolis/app/pages/quizzer/availables/quizz/widgets/optional/custom_evidence.widget.dart';
import 'package:Cinepolis/app/pages/quizzer/availables/quizz/widgets/survey_objects/custom_editext.widget.dart';
import 'package:Cinepolis/app/pages/quizzer/availables/quizz/widgets/survey_objects/custom_multiple_choice.widget.dart';
import 'package:Cinepolis/app/pages/quizzer/availables/quizz/widgets/survey_objects/custom_multiple_options.widget.dart';
import 'package:Cinepolis/app/pages/quizzer/availables/quizz/widgets/survey_objects/custom_rating.widget.dart';
import 'package:Cinepolis/app/pages/quizzer/availables/quizz/widgets/survey_objects/custom_text.widget.dart';
import 'package:Cinepolis/app/pages/quizzer/availables/quizz/widgets/survey_objects/custom_yes_or_not.widget.dart';
import 'package:Cinepolis/app/pages/quizzer/finish/finish.page.dart';
import 'package:Cinepolis/app/utils/images.utils.dart';
import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/models/entities/dynamic/evidences.model.dart';
import 'package:Cinepolis/data/models/entities/files/file_manager.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_finish.model.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_object_refs.model.dart';
import 'package:Cinepolis/data/services/filemanager/file_manager.contract.dart';
import 'package:Cinepolis/data/services/quizzer/quizzers.service.contract.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizzerAnswersController extends GetxController {
  final IQuizzerService _quizzerService;
  final IFileManagerService _fileManagerService;

  QuizzerAnswersController(this._quizzerService, this._fileManagerService);

  //Yes or Not
  var isYes = false.obs;
  var changeColor = [Colors.grey, Colors.grey].obs;

  //Text
  var customText = ''.obs;

  //Rating
  var rating = 1.0.obs;

  //TextField
  var customEditext = TextEditingController(text: null).obs;
  var hintLabel = ''.obs;
  TextInputType textInputType = TextInputType.text;

  //Evidence
  var imagesLoading = false.obs;
  String imagesUrl = Environments.FILE_MANAGER_VIEW_URL;
  var quizzerData = Quizz.fromVoid().obs;
  var quantityArray = 0.obs;

  //Multi Choise
  var valueChoise = 0.obs;
  var itemChoise = <Widget>[].obs;

  //Multi Options
  var textCards = 'Item'.obs;
  var validationColor = List.generate(40, (i) => false).obs;
  var listItems = <Option>[].obs;

  Widget selectedWidget = Container();

  //Get params of Available
  var campaingId = Get.parameters.values.first;
  var branchId = int.parse(Get.parameters.values.last!);

  //loading
  var loading = false.obs;

  //Send data to Object Refs
  var objectRefs = ObjectRefs.fromVoid();

  //Get data Response Object Refs
  var responseObjectRefs = ResponseObjectRefs.fromVoid().obs;

  //Selected options id
  var selectedOptionId = 0.obs;

  //loading save
  var loadingSave = false.obs;

  //GPS
  Position currentPosition = Position(
      longitude: 0,
      latitude: 0,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0);

  @override
  void onInit() async {
    super.onInit();
    currentPosition = await _determinePosition();
    loading.value = true;
    getQuizzer(int.parse(campaingId.toString()));
    loading.value = false;
  }

  //EdiText
  changeStatus() {
    //We change text for the api
    if (quizzerData.value.object!.observationsLabel.toString() == 'null') {
      hintLabel.value = 'Respuesta';
    } else {
      hintLabel.value = quizzerData.value.object!.observationsLabel.toString();
    }
  }

  getQuizzer(int campaingID) async {
    itemChoise.clear();
    print(campaingID);
    quizzerData.value = await _quizzerService.getQuizzer(campaingID);

    if (quizzerData.value.isCompleted == false) {
      quizzerData.value.object!.options!
          .forEach((element) => itemChoise.add(CustomMultipleChoice(element)));

      customText.value = quizzerData.value.label.toString();

      if (quizzerData.value.object!.inputValidationTypeId! == 2) {
        textInputType = TextInputType.emailAddress;
      } else if (quizzerData.value.object!.inputValidationTypeId! == 3) {
        textInputType =
            TextInputType.numberWithOptions(decimal: true, signed: false);
      }

      switch (quizzerData.value.object!.objectTypeId!) {
        case 1:
          selectedWidget = CustomYesOrNot();
          break; //yes/no

        case 2:
          selectedWidget = Obx(() => ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: itemChoise));
          break;

        case 3:
          selectedWidget = CustomEditText();
          break;

        case 4:
          selectedWidget = CustomRating();
          break; //calificacion //indicacion

        case 5:
          if (quizzerData.value.object!.label == null) {
            selectedWidget = CustomText();
            return;
          }
          break;

        case 6:
          if (quizzerData.value.object!.allowFiles == false) {
            selectedWidget = OptionalEvidence();
            return;
          }
          break;

        case 7:
          selectedWidget = CustomMultipleOptions();
          break; //opcion multiple(multisleccion)

        default:
          selectedWidget =
              Container(child: Text('Ha ocurrido un error intente nuevamente'));
          break;
      }
    } else {
      Get.to(() => QuizzerFinishPage());
      return;
    }
  }

  //Yes or NOt
  btnYes() {
    isYes.value = true;
    changeColor.first =
        changeColor.first == Colors.green ? Colors.grey : Colors.green;
    changeColor.last = Colors.grey;
  }

  btnNot() {
    isYes.value = false;
    changeColor.last =
        changeColor.last == Colors.red ? Colors.grey : Colors.red;
    changeColor.first = Colors.grey;
  }

  saveRequest() async {
    var editextObservation;
    var editextValue;
    List<ReferenceSelectedOption> selectOption = [];
    loadingSave.value = true;

    //Validacion de archivos
    if (quizzerData.value.object!.allowFiles == true ||
        quizzerData.value.object!.objectTypeId == 6) {
      if (quizzerData.value.files!.length == 0) {
        SnackUtils.error('Ingresa evidencia antes de continuar', 'Advertencia');
        return;
      } else if (quantityArray.value <
          int.parse(quizzerData.value.object!.minValueFiles.toString())) {
        SnackUtils.error(
            'Ingresa minimo ${quizzerData.value.object!.minValueFiles} evidencias',
            'Advertencia');
        return;
      }
    }

    if (quizzerData.value.object!.allowObservations == true) {
      //Recolectamos su valor del editext
      editextObservation = customEditext.value.text;
      if (editextObservation.toString().isEmpty) {
        SnackUtils.error('Ingresa una observación', 'Advertencia');
        return;
      }
    }

    if (quizzerData.value.object!.objectTypeId == 3) {
      editextValue = customEditext.value.text;
      if (editextValue.toString().isEmpty) {
        SnackUtils.error('Ingresa una observación', 'Advertencia');
        return;
      }
    }

    //YES OR NOT
    if (quizzerData.value.object!.objectTypeId == 1) {
      editextValue = isYes.value.toString();
    }

    //Opcion multiple (una opcion)
    if (quizzerData.value.object!.objectTypeId == 2) {
      if (valueChoise.value == 0) {
        SnackUtils.error('Selecciona una opción', 'Advertencia');
        return;
      } else {
        selectedOptionId.value = valueChoise.value;
      }
    }

    //Opcion multiple (varias opciones)
    if (quizzerData.value.object!.objectTypeId == 7) {
      if (listItems.length == 0) {
        SnackUtils.error('Selecciona una opción o más', 'Advertencia');
        return;
      } else {
        listItems.forEach((element) {
          selectOption.add(ReferenceSelectedOption(
              id: int.parse(element.id.toString()),
              name: element.label.toString()));
        });
      }
    }

    //Rating
    if (quizzerData.value.object!.objectTypeId == 4) {
      editextValue = rating.value;
    }

    var object = ObjectRefs(
        id: int.parse(quizzerData.value.id.toString()),
        referenceSelectedOptionId: selectedOptionId.value,
        referenceSelectedOptions: selectOption,
        value: editextValue,
        observations: editextObservation,
        files: quizzerData.value.files!,
        branchId: branchId,
        latitude: currentPosition.latitude,
        longitude: currentPosition.longitude);

    await _quizzerService.sendRequest(object).then((value) {
      responseObjectRefs.value = ResponseObjectRefs.fromJson(value);

      clean();
      loadingSave.value = false;

      if (responseObjectRefs.value.isCompleted == false) {
        getQuizzer(responseObjectRefs.value.userCampaignId);
      } else {
        print('FINALIZACION');
      }
    });
  }

  clean() {
    changeColor = [Colors.grey, Colors.grey].obs;
    validationColor = List.generate(40, (i) => false).obs;
    selectedWidget = Container();
    customEditext.value = TextEditingController(text: null);
    rating.value = 0.0;
    quantityArray.value = 0;
    valueChoise.value = 0;
    listItems.clear();
  }

  completeQuizzer() async {
    await _quizzerService.finishQuizzer(
        int.parse(campaingId.toString()),
        FinishQuizzer(
            id: int.parse(campaingId.toString()),
            geolocationEnd:
                "${currentPosition.latitude}, ${currentPosition.longitude}"));

    cancelationQuizzer();
    Get.back();
    SnackUtils.success("Encuesta terminada con exito");
  }

  cancelationQuizzer() {
    Get.back();
    Get.back();
  }

  // File Manager
  takeImage(BuildContext context) {
    loadingSave.value = true;
    if (quizzerData.value.files!.length >
        quizzerData.value.object!.maxValueFiles!) {
      SnackUtils.error(
          'Solo puedes agregar *(Min - ${quizzerData.value.object!.minValueFiles} Max - ${quizzerData.value.object!.maxValueFiles})',
          'Advertencia');
      return;
    }
    ImageUtils.takeImage(context, _fileManagerService, onSelected: () {
      imagesLoading.value = true;
    }, onCompleted: _imageCallback);
  }

  _imageCallback(FileManager file) {
    quantityArray.value++;

    String fileManagerName = '${file.name}${file.extension}'.trim();
    quizzerData.value.files!.add(Evidences(
        fileManagerId: file.id,
        fileManagerName: fileManagerName,
        fileManagerExtension: file.extension,
        fileManagerRealName: file.realName,
        id: file.id,
        mimeType: file.mimeType));
    imagesLoading.value = false;
    loadingSave.value = false;
  }

  deleteEvidence(Evidences evidence) {
    imagesLoading.value = true;
    quizzerData.value.files!.remove(evidence);
    quantityArray.value--;
    imagesLoading.value = false;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.back();
        return SnackUtils.error(
            "Los permisos de ubicación están denegados", "Advertencia");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.back();
      return SnackUtils.error(
          "Los permisos de ubicación se negaron permanentemente, no puedes usar esta función.",
          "Advertencia");
    }

    return await Geolocator.getCurrentPosition();
  }
}
