import 'package:Cinepolis/app/pages/audit/rotisserie_inventory/inventory_detail/rotisserie_inventory_detail.controller.dart';
import 'package:Cinepolis/app/pages/audit/rotisserie_inventory/inventory_detail/widget/rostisserie_tem.widget.dart';
import 'package:Cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:Cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RotisserieInventoryDetailPage
    extends GetView<RotisserieInventoryDetailController> {
  final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppBar(title: "Detalle"),
        body: Obx(() {
          return ListView(
            physics: BouncingScrollPhysics(),
            children: [
              controller.loadingList.value
                  ? Center(child: ProgressPrimary().paddingAll(10))
                  : _listWidget(context),
              _cardTotal(context).paddingOnly(bottom: 15),
            ],
          );
        }));
  }

  Widget _listWidget(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.detail.value.rostisserieBalanceProducts!.length,
          itemBuilder: (_, i) {
            return RostisserieInventoryItemDetail(
                controller
                    .detail.value.rostisserieBalanceProducts![i].productName,
                controller.detail.value.rostisserieBalanceProducts![i].stock,
                controller.detail.value.rostisserieBalanceProducts![i].total,
                controller
                    .detail.value.rostisserieBalanceProducts![i].changesPending,
                controller.difference(
                    controller
                        .detail.value.rostisserieBalanceProducts![i].stock,
                    controller
                        .detail.value.rostisserieBalanceProducts![i].total),
                controller
                    .detail.value.rostisserieBalanceProducts![i].observations,
                controller.moneyDifferenceMultiplication(
                    controller
                        .detail.value.rostisserieBalanceProducts![i].unitPrice,
                    controller
                        .detail.value.rostisserieBalanceProducts![i].stock));
          });
    });
  }

  Widget _cardTotal(BuildContext context) {
    return Obx(() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _subtitle(context,
                  "Total Diferencias:  \$ ${controller.sumTotalDifference.value.toPrecision(2)}"),
              _subtitle(context,
                      "Diferencias en Productos:  \$ ${controller.sumTotalProduct.value.toPrecision(2)}")
                  .paddingOnly(top: 10),
            ],
          ),
        )));
  }

  Widget _subtitle(BuildContext context, String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.white),
        overflow: TextOverflow.fade,
        maxLines: 1,
        softWrap: false,
        textWidthBasis: TextWidthBasis.parent,
      ),
    );
  }
}
