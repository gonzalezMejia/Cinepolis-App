import 'package:Cinepolis/app/pages/audit/rotisserie_inventory/inventory_new/rotisserie_inventory_new.controller.dart';
import 'package:Cinepolis/app/utils/card_status.utils.dart';
import 'package:Cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:Cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:Cinepolis/data/models/entities/audit/rotisserie.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RotisserieInventoryNewPage
    extends GetView<RotisserieInventoryNewController> {
  const RotisserieInventoryNewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppBar(
          title: "Nuevo Inventario",
          actions: [
            IconButton(
                icon: Icon(
                  Icons.double_arrow,
                  size: 30,
                ),
                onPressed: () => controller.nextStep()),
          ],
        ),
        body: Obx(
          () => controller.loading.value
              ? Center(child: ProgressPrimary())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _detailsWidget(context)),
                    _screenBottom(context)
                  ],
                ),
        ));
  }

  Widget _detailsWidget(BuildContext context) {
    var products = controller.rotisserie.value.rostisserieBalanceProducts!;
    return Visibility(
      visible: products.isNotEmpty,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (_, i) {
            return _itemProducts(context, products[i], i);
          }),
      replacement: Center(
          child: Text(
        "NO HAY DATOS A MOSTRAR",
        style: Theme.of(context).textTheme.subtitle1,
      )),
    );
  }

  _itemProducts(
      BuildContext context, RostisserieBalanceProducts product, int i) {
    return GestureDetector(
      onTap: () => controller.onItemSelect(context, i),
      child: ListTile(
        leading: StatusIndicator.progress(),
        title: Text(
          product.productName!,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle:
            Divider(thickness: 1.5, endIndent: 70, color: Colors.grey[600]!),
      ),
    );
  }

  Widget _screenBottom(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textPlain(context, "Total diferencias:",
                  controller.totalDifferencesP.value.toInt())
              .marginAll(15),
          Divider(
            endIndent: 20,
            indent: 20,
          ),
          _textPlain(context, "Diferencia en productos: ",
                  controller.totalDifferencesN.value.toInt())
              .marginAll(15),
        ],
      ),
    ).paddingOnly(bottom: 20, right: 20, left: 20);
  }

  Widget _textPlain(BuildContext context, String title, int content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .apply(fontWeightDelta: FontWeight.bold.index),
        ),
        Text(
          content.toString(),
          style: Theme.of(context).textTheme.subtitle1,
        )
      ],
    );
  }
}
