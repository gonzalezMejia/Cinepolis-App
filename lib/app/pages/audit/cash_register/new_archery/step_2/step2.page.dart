import 'package:Cinepolis/app/pages/audit/cash_register/new_archery/new_archery.controller.dart';
import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:Cinepolis/app/widgets/custom_container/custom_container.widget.dart';
import 'package:Cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Step2Page extends GetView<NewArcheryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppBar(
          title: "Nuevo Arqueo",
          actions: [
            Obx(() {
              return controller.loading.value
                  ? Container()
                  : IconButton(
                      onPressed: () => MsgUtils.confirm(
                          context,
                          "Seguro quieres limpiar los campos",
                          () => controller.clean(),
                          () {}),
                      icon: Icon(
                        Icons.refresh_rounded,
                        size: 28,
                      ));
            }),
            Obx(() {
              return controller.loading.value
                  ? Container()
                  : IconButton(
                      onPressed: () => controller.save(),
                      icon: Icon(
                        Icons.save_outlined,
                        size: 28,
                      ));
            }),
          ],
        ),
        body: Obx(() {
          return controller.loading.value
              ? Center(child: ProgressPrimary())
              : Column(children: [
                  controller.validateCombo()
                      ? Flexible(
                          child: ListView(
                            children: [
                              _cardReceiptTickets(context),
                              _cardBanknotesBox(context),
                              _cardCoinsGuard(context),
                              _cardCoinsBox(context),
                              _cardGrandTotal(context).paddingOnly(bottom: 15)
                            ],
                          ),
                        )
                      : Container()
                ]);
        }));
  }

  Widget _cardReceiptTickets(BuildContext context) {
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
              Text(
                "Billetes Resguardo",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ).paddingOnly(top: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 20",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label(
                          "Total",
                          controller.ticketsGuardTotalAmount20.value
                              .toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationTicketsGuard(20),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.ticketsGuardAmount20.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 50",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label(
                          "Total",
                          controller.ticketsGuardTotalAmount50.value
                              .toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationTicketsGuard(50),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.ticketsGuardAmount50.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 100",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label(
                          "Total",
                          controller.ticketsGuardTotalAmount100.value
                              .toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationTicketsGuard(100),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.ticketsGuardAmount100.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 200",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label(
                          "Total",
                          controller.ticketsGuardTotalAmount200.value
                              .toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationTicketsGuard(200),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.ticketsGuardAmount200.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 500",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label(
                          "Total",
                          controller.ticketsGuardTotalAmount500.value
                              .toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationTicketsGuard(500),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.ticketsGuardAmount500.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 1,000",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label(
                          "Total",
                          controller.ticketsGuardTotalAmount1000.value
                              .toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationTicketsGuard(1000),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.ticketsGuardAmount1000.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              _label("Total General",
                      '${controller.ticketGuardTotalAmountGeneral.value}')
                  .paddingOnly(top: 20),
            ],
          ),
        )));
  }

  Widget _cardBanknotesBox(BuildContext context) {
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
              Text(
                "Billetes Caja",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ).paddingOnly(top: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 20",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label("Total",
                          controller.ticketsBoxTotalAmount20.value.toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationTicketsBox(20),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.ticketsBoxAmount20.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 50",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label("Total",
                          controller.ticketsBoxTotalAmount50.value.toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationTicketsBox(50),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.ticketsBoxAmount50.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 100",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label(
                          "Total",
                          controller.ticketsBoxTotalAmount100.value
                              .toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationTicketsBox(100),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.ticketsBoxAmount100.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 200",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label(
                          "Total",
                          controller.ticketsBoxTotalAmount200.value
                              .toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationTicketsBox(200),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.ticketsBoxAmount200.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 500",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label(
                          "Total",
                          controller.ticketsBoxTotalAmount500.value
                              .toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationTicketsBox(500),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.ticketsBoxAmount500.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 1,000",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label(
                          "Total",
                          controller.ticketsBoxTotalAmount1000.value
                              .toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationTicketsBox(1000),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.ticketsBoxAmount1000.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              _label("Total General",
                      '${controller.ticketsBoxTotalAmountGeneral.value}')
                  .paddingOnly(top: 20),
            ],
          ),
        )));
  }

  Widget _cardCoinsGuard(BuildContext context) {
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
              Text(
                "Monedas Resguardo",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ).paddingOnly(top: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 1",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label("Total",
                          controller.coinsGuardTotalAmount1.value.toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationCoinsGuard(1),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.coinsGuardAmount1.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 2",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label("Total",
                          controller.coinsGuardTotalAmount2.value.toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationCoinsGuard(2),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.coinsGuardAmount2.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 5",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label("Total",
                          controller.coinsGuardTotalAmount5.value.toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationCoinsGuard(5),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.coinsGuardAmount5.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 10",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label("Total",
                          controller.coinsGuardTotalAmount10.value.toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationCoinsGuard(10),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.coinsGuardAmount10.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 20",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label("Total",
                          controller.coinsGuardTotalAmount20.value.toString())),
                  Flexible(
                      child: _iconButton(
                          () => controller.operationCoinsGuard(20),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.coinsGuardAmount20.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              _label("Total General",
                      '${controller.coinsGuardTotalAmountGeneral.value}')
                  .paddingOnly(top: 20),
            ],
          ),
        )));
  }

  Widget _cardCoinsBox(BuildContext context) {
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
              Text(
                "Monedas Caja",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ).paddingOnly(top: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 1",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label("Total",
                          controller.coinsBoxTotalAmount1.value.toString())),
                  Flexible(
                      child: _iconButton(() => controller.operationCoinsBox(1),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.coinsBoxAmount1.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 2",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label("Total",
                          controller.coinsBoxTotalAmount2.value.toString())),
                  Flexible(
                      child: _iconButton(() => controller.operationCoinsBox(2),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.coinsBoxAmount2.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 5",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label("Total",
                          controller.coinsBoxTotalAmount5.value.toString())),
                  Flexible(
                      child: _iconButton(() => controller.operationCoinsBox(5),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.coinsBoxAmount5.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 10",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label("Total",
                          controller.coinsBoxTotalAmount10.value.toString())),
                  Flexible(
                      child: _iconButton(() => controller.operationCoinsBox(10),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.coinsBoxAmount10.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("\$ 20",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: _label("Total",
                          controller.coinsBoxTotalAmount20.value.toString())),
                  Flexible(
                      child: _iconButton(() => controller.operationCoinsBox(20),
                          Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.coinsBoxAmount20.value,
                        context,
                        "Cantidad",
                      )),
                ],
              ).paddingOnly(top: 15),
              _label("Total General",
                      '${controller.coinsBoxTotalAmountGeneral.value}')
                  .paddingOnly(top: 20),
            ],
          ),
        )));
  }

  Widget _cardGrandTotal(BuildContext context) {
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
              Text(
                "Gran Total",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ).paddingOnly(top: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 2,
                      child: _label("Acumulado Billetes",
                              '\$ ${controller.grandTotalTickets.value}')
                          .paddingOnly(right: 5)),
                  Flexible(
                      flex: 2,
                      child: _label("Acumulado Monedas",
                              '\$ ${controller.grandTotalCoins.value}')
                          .paddingOnly(left: 5)),
                ],
              ).paddingOnly(top: 15),
            ],
          ),
        )));
  }

  Widget _editext(
      TextEditingController control, BuildContext context, String label) {
    return TextField(
      onChanged: (text) => controller.depositoryToComplete(text),
      keyboardType: TextInputType.number,
      obscureText: false,
      controller: control,
      cursorColor: Theme.of(context).hoverColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(color: Theme.of(context).hoverColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hoverColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hoverColor),
        ),
      ),
    );
  }

  Widget _iconButton(Function function, Icon icon) {
    return IconButton(onPressed: () => function(), icon: icon);
  }

  Widget _label(String label, String text) {
    return CustomContainer(labelText: label, children: [
      Text(
        '$text',
        style: TextStyle(fontSize: 16.5),
      ),
    ]);
  }
}
