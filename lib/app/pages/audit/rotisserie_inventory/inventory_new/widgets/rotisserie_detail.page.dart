import 'package:Cinepolis/app/pages/audit/rotisserie_inventory/inventory_new/rotisserie_inventory_new.controller.dart';
import 'package:Cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:Cinepolis/app/widgets/image_detail.widget/evidence-image-detail.widget.dart';
import 'package:Cinepolis/app/widgets/image_detail.widget/evidence_image.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RotisserieDetailPage extends GetView<RotisserieInventoryNewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: 'Arqueo de caja',
        actions: [
          IconButton(
              icon: Icon(
                Icons.save,
                size: 30,
              ),
              onPressed: () => controller.onSave()),
        ],
      ),
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    var cash = controller.rotisserie.value.rostisserieBalanceCash!;
    return Obx(
      () => ListView(
        children: [
          _titleWidget(context, "Efectivo en Caja: \$", cash.cashTotal!, true,
              (val) => cash.cashTotal = val),
          _titleWidget(context, "Pago Tarjeta Voucher: \$", cash.voucherTotal!,
              true, (val) => cash.voucherTotal = val),
          _titleTextController(
              context, "Total (Efectivo + Tarjeta): \$", cash.cashXCard!),
          _titleWidget(context, "Total de la Venta: \$", cash.saleTotal!, true,
              (val) => cash.saleTotal = val),
          _titleWidget(context, "Cambio Prestado: \$", cash.borrowedChange!,
              true, (val) => cash.borrowedChange = val),
          //para obtener su cantidad se deberá hacer una diferencia de
          // “Total (efectivo voucher) menos (-) la sumatoria de “Total de la venta” mas (+) “Cambio prestado”
          _titleTextController(
              context, "Diferencia en el Arqueo: \$", cash.differenceTonnage!),
          _evidencesWidget(context).paddingAll(15)
        ],
      ),
    );
  }

  Widget _titleWidget(BuildContext context, String title, double count,
      bool isEditing, Function(double val) onSave) {
    final controllerText = TextEditingController(text: count.toString());
    return Row(children: [
      Expanded(
        flex: 1,
        child: Text(title,
            style: Theme.of(context).textTheme.bodyText1,
            softWrap: false,
            maxLines: 10,
            overflow: TextOverflow.ellipsis),
      ),
      SizedBox(
          width: 200,
          child: Row(children: [
            IconButton(
                icon: Icon(Icons.remove, size: 20),
                onPressed: !isEditing
                    ? null
                    : () {
                        count = count - 1;
                        controllerText.text = count.toString();
                        onSave(count);
                        controller.calculateArching();
                      }),
            SizedBox(
                width: 100,
                height: 40,
                child: TextField(
                  enabled: isEditing,
                  textAlign: TextAlign.center,
                  obscureText: false,
                  controller: controllerText,
                  keyboardType: TextInputType.number,
                  keyboardAppearance: Brightness.dark,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                  ),
                  onChanged: (value) {
                    var val = double.tryParse(value) ?? 0;
                    if (val > 0) {
                      count = val;
                      onSave(count);
                      controller.calculateArching();
                    }
                  },
                )),
            IconButton(
                icon: Icon(Icons.add, size: 20),
                onPressed: !isEditing
                    ? null
                    : () {
                        count = count + 1;
                        controllerText.text = count.toString();
                        onSave(count);
                        controller.calculateArching();
                      }),
          ])),
    ]).paddingAll(12);
  }

  Widget _titleTextController(BuildContext context, String title,
      TextEditingController controllerText) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: Text(title,
            style: Theme.of(context).textTheme.bodyText1,
            softWrap: false,
            maxLines: 10,
            overflow: TextOverflow.ellipsis),
      ),
      SizedBox(
          width: 200,
          child: Row(children: [
            IconButton(icon: Icon(Icons.remove, size: 20), onPressed: null),
            SizedBox(
                width: 100,
                height: 40,
                child: TextField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  obscureText: false,
                  controller: controllerText,
                  keyboardType: TextInputType.number,
                  keyboardAppearance: Brightness.dark,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                  ),
                )),
            IconButton(icon: Icon(Icons.add, size: 20), onPressed: null),
          ])),
    ]).paddingAll(12);
  }

  Widget _evidencesWidget(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              "Evidencias (${controller.quantityArray.value} / 6)",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
          Visibility(
            visible: controller.quantityArray.value < 6,
            child: RawMaterialButton(
              onPressed: () => controller.takeImage(context),
              elevation: 2.0,
              fillColor: Theme.of(context).hoverColor,
              child: Icon(
                Icons.add_a_photo,
                size: 35.0,
                color: Theme.of(context).primaryColor,
              ),
              padding: EdgeInsets.all(25.0),
              shape: CircleBorder(),
            ).paddingOnly(top: 10, bottom: 10),
          ),
          _evidencesGridWidget(context)
        ]);
  }

  Widget _evidencesGridWidget(BuildContext context) {
    return controller.imagesLoading.value
        ? Center(child: CircularProgressIndicator())
        : GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount:
                controller.rotisserie.value.rostisserieBalanceDocuments!.length,
            itemBuilder: (BuildContext context, int index) {
              return EvidenceImage(
                  item:
                      '${controller.imagesUrl}/${controller.rotisserie.value.rostisserieBalanceDocuments![index].fileManagerName}',
                  onPressed: () {
                    Get.to(() => ImageDetail(
                        onDelete: () => controller.deleteEvidence(controller
                            .rotisserie
                            .value
                            .rostisserieBalanceDocuments![index]),
                        evidence: controller.rotisserie.value
                            .rostisserieBalanceDocuments![index]));
                  });
            });
  }
}
