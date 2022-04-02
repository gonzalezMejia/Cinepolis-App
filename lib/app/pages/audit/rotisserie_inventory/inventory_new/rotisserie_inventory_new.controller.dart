import 'package:Cinepolis/app/pages/audit/rotisserie_inventory/inventory_new/widgets/rotisserie_detail.dialog.dart';
import 'package:Cinepolis/app/pages/audit/rotisserie_inventory/inventory_new/widgets/rotisserie_detail.page.dart';
import 'package:Cinepolis/app/utils/images.utils.dart';
import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/core/routes/pages.dart';
import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/models/entities/audit/rotisserie.model.dart';
import 'package:Cinepolis/data/models/entities/dynamic/evidences.model.dart';
import 'package:Cinepolis/data/models/entities/files/file_manager.model.dart';
import 'package:Cinepolis/data/services/audit/audit.contract.dart';
import 'package:Cinepolis/data/services/filemanager/file_manager.contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RotisserieInventoryNewController extends GetxController {
  late final IFileManagerService _fileManagerService;
  late final IAuditService _auditService;

  var loading = true.obs;
  var rotisserie = Rotisserie.fromVoid().obs;
  //evidence
  var imagesLoading = false.obs;
  String imagesUrl = Environments.FILE_MANAGER_VIEW_URL;
  var quantityArray = 0.obs;

  var totalDifferencesN = 0.0.obs;
  var totalDifferencesP = 0.0.obs;

  RotisserieInventoryNewController(
      this._fileManagerService, this._auditService);

  @override
  void onInit() {
    super.onInit();
    _auditService
        .getRotisserieBalances(int.tryParse(Get.parameters.values.first!) ?? 0)
        .then((value) {
      rotisserie.value = value;
      changeBoxText();
      loading.value = false;
    });
  }

  changeBoxText() {
    totalDifferencesN.value = accumulatedPesos(isNegative: true);
    totalDifferencesP.value = accumulatedPesos(isNegative: false);
  }

  onItemSelect(BuildContext context, int position) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) => SingleChildScrollView(
        child: Container(
          color: Theme.of(context).indicatorColor,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: RotisserieDetailDialog(position),
        ),
      ),
    );
  }

  nextStep() {
    /* var actives=rotisserie.value.rostisserieBalanceProducts!.firstWhere((element) => element.observations==null);
  if(actives.observations==null)
    return SnackUtils.error("El campo de obsercaciones debe de estar en el rango de 15 a 100 caracteres\n Agrega una observación en ${actives.productName}", "Advertencía");
  else */
    Get.to(() => RotisserieDetailPage());
    calculateArching();
  }

  // File Manager
  takeImage(BuildContext context) {
    if (rotisserie.value.rostisserieBalanceDocuments!.length >= 6) {
      SnackUtils.error('Solo puedes agregar *(Min - 1 Max - 6)', 'Advertencia');
      return;
    }
    ImageUtils.takeImage(context, _fileManagerService, onSelected: () {
      imagesLoading.value = true;
    }, onCompleted: _imageCallback);
  }

  _imageCallback(FileManager file) {
    quantityArray.value++;

    String fileManagerName = '${file.name}${file.extension}'.trim();

    rotisserie.value.rostisserieBalanceDocuments!.add(Evidences(
        id: 0,
        fileManagerId: file.id,
        fileManagerName: fileManagerName,
        fileManagerExtension: file.extension,
        fileManagerRealName: file.realName,
        mimeType: file.mimeType));

    imagesLoading.value = false;
  }

  deleteEvidence(Evidences evidence) {
    imagesLoading.value = true;
    rotisserie.value.rostisserieBalanceDocuments!.remove(evidence);
    quantityArray.value--;
    imagesLoading.value = false;
    Get.back();
  }

  onSave() {
    if (rotisserie.value.rostisserieBalanceDocuments!.length < 1) {
      return SnackUtils.error(
          'Ingresa Evidencias para Continuar', 'Advertencia');
    } else {
      print(rotisserie.value.toJson());
      _auditService.addRotisserieBalances(rotisserie.value).then((value) {
        Get.offNamedUntil(Routes.ROTISSERIE_INVENTORY,
            ModalRoute.withName(Routes.ROTISSERIE_INVENTORY));
        Get.back();
        SnackUtils.success("Inventario guardado con exito");
      });
    }
  }

  double accumulatedPesos({bool isNegative = true}) {
    double totalDifferences = 0;
    rotisserie.value.rostisserieBalanceProducts!.forEach((element) {
      element.differenceParts!.text =
          ((element.stock! - element.physicalExistence!).toInt()).toString();
      element.differencePesos!.text =
          (((element.stock! - element.physicalExistence!) * element.unitPrice!)
                  .toInt())
              .toString();
      double textXDouble =
          (double.tryParse(element.differencePesos!.text) ?? 0);
      if (isNegative) {
        if (textXDouble.isNegative)
          totalDifferences = totalDifferences - textXDouble;
      } else {
        if (!textXDouble.isNegative)
          totalDifferences = totalDifferences + textXDouble;
      }
    });

    return totalDifferences;
  }

  calculateArching() {
    var cash = rotisserie.value.rostisserieBalanceCash!;
    cash.cashXCard!.text = (cash.voucherTotal! + cash.cashTotal!).toString();
    cash.differenceTonnage!.text = (cash.saleTotal! +
            cash.borrowedChange! -
            (cash.voucherTotal! + cash.cashTotal!))
        .toString();
  }
}
