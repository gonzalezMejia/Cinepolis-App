import 'package:Cinepolis/app/pages/audit/cash_register/new_archery/new_archery.controller.dart';
import 'package:Cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:Cinepolis/app/widgets/custom_container/custom_container.widget.dart';
import 'package:Cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:Cinepolis/data/models/entities/audit/business_type.model.dart';
import 'package:Cinepolis/data/models/entities/branches/branch.model.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class NewArcheryPage extends GetView<NewArcheryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppBar(
          title: "Nuevo Arqueo",
          actions: [
            IconButton(
                onPressed: () => controller.next(),
                icon: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 35,
                ))
          ],
        ),
        body: Obx(() {
          return controller.loading.value
              ? Center(child: ProgressPrimary())
              : Column(children: [
                  _branchesWidget(context)
                      .paddingOnly(left: 20, right: 20, top: 5),
                  controller.visibleBusiness.value
                      ? _businessTypeWidget()
                          .paddingOnly(left: 20, right: 20, top: 15, bottom: 10)
                      : Container(),
                  controller.validateCombo()
                      ? Flexible(
                          child: ListView(
                            children: [
                              _cardGuard(context),
                              controller.loadingCash.value
                                  ? Center(child: ProgressPrimary())
                                      .paddingOnly(top: 15)
                                  : _cardBox(context),
                              _cardRetirement(context),
                              _cardTotal(context),
                              _cardObservation(context).paddingOnly(bottom: 10)
                            ],
                          ),
                        )
                      : Container()
                ]);
        }));
  }

  Widget _branchesWidget(BuildContext context) {
    return TypeAheadField<Branch?>(
      textFieldConfiguration: TextFieldConfiguration(
          autofocus: true,
          style: Theme.of(context).textTheme.subtitle2,
          controller: controller.searchController.value,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    controller.selectedBranchId.value = 0;
                    controller.searchController.value.text = "";
                  }),
              labelText: "Sucursal",
              border: OutlineInputBorder())),
      suggestionsCallback: (pattern) async {
        return controller.getAllBranch(pattern);
      },
      autoFlipDirection: false,
      itemBuilder: (context, suggestion) {
        return ListTile(
          leading: Icon(Icons.storefront),
          title: Text(suggestion!.descripcion),
          subtitle: Text(suggestion.idUnidadOperativa.toString()),
        );
      },
      onSuggestionSelected: (suggestion) {
        controller.changeBranch(type: suggestion!.idUnidadOperativa);
        controller.searchController.value.text =
            "${suggestion.idUnidadOperativa} - ${suggestion.descripcion}";
      },
    );
  }

  Widget _businessTypeWidget() {
    return DropdownButtonFormField<BusinessType>(
      isExpanded: true,
      items: controller.listBusiness
          .map((i) => DropdownMenuItem(value: i, child: Text('${i.name}')))
          .toList(),
      onChanged: (i) => controller.changeBusiness(type: i!.id!),
      decoration: InputDecoration(
        labelText: "Giro",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }

  Widget _cardGuard(BuildContext context) {
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
                "Resguardo sin acceso a cofre de valores",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ).paddingOnly(top: 5),
              _editext(controller.depositPendingSend.value, context,
                      "Depósitos pendientes a enviar")
                  .paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 1,
                      child:
                          _label("Depósitos", controller.deposit.value.text)),
                  Expanded(
                      flex: 2, child: _date(context).paddingOnly(left: 15)),
                ],
              ).paddingOnly(top: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 2,
                      child: _editext(controller.yesterdayRetreats.value,
                          context, "Retiros de ayer")),
                  Flexible(
                      child: _iconButton(
                          () => controller.sumGuard(), Icon(Icons.add))),
                  Flexible(
                      flex: 2,
                      child: _editext(
                        controller.sumWithdrawal.value,
                        context,
                        "Sumar a retiros",
                      )),
                ],
              ).paddingOnly(top: 10),
              _label("Depósitos a completar",
                      '${controller.totalDepositoryToComplete.value}')
                  .paddingOnly(top: 10),
            ],
          ),
        )));
  }

  Widget _cardBox(BuildContext context) {
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
                "Caja",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ).paddingOnly(top: 5),
              _label("Depósitos a completar",
                      '${controller.totalDepositoryToComplete.value}')
                  .paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: _label("Total venta del día",
                            '\$ ${controller.totalSaleDay.value}')
                        .paddingOnly(top: 15, right: 5),
                  ),
                  Flexible(
                    child: _label("Cambio de apertura",
                            '${controller.openingChange.value.toPrecision(2)}')
                        .paddingOnly(top: 15, left: 5),
                  ),
                ],
              ),
              _label("Total en caja",
                      '\$ ${controller.totalCash.value.toPrecision(2)}')
                  .paddingOnly(top: 15),
            ],
          ),
        )));
  }

  Widget _cardRetirement(BuildContext context) {
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
                "Retiros",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ).paddingOnly(top: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _editextRetreats(controller.retreatsDay.value,
                        context, "Retiros del día"),
                  ),
                  Expanded(
                      child: _editextRetreats(controller.messenger.value,
                              context, "Mensajería y/o Adjvo")
                          .paddingOnly(left: 15)),
                ],
              ).paddingOnly(top: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _editextRetreats(controller.currency.value, context,
                        "Moneda en cofre de valores"),
                  ),
                  Expanded(
                      child: _editextRetreats(
                              controller.other.value, context, "Otro")
                          .paddingOnly(left: 15)),
                ],
              ).paddingOnly(top: 10),
              _label("Subtotal", '\$ ${controller.subtotalRetreats.value}')
                  .paddingOnly(top: 10),
            ],
          ),
        )));
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
              Text(
                "Totales",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ).paddingOnly(top: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _label("Total de efectivo",
                            '\$ ${controller.totalTotales.value}')
                        .paddingOnly(right: 5),
                  ),
                  Expanded(
                      child: _label("Total de gastos",
                              '\$ ${controller.totalExpanses.value}')
                          .paddingOnly(left: 5)),
                ],
              ).paddingOnly(top: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _label("Total de vaucher",
                            '\$ ${controller.totalVoucher.value}')
                        .paddingOnly(right: 5),
                  ),
                  Expanded(
                      child: _label("Total del arqueo",
                              '\$ ${controller.totalBox.value}')
                          .paddingOnly(left: 5)),
                ],
              ).paddingOnly(top: 10),
              _label("Diferencia real",
                      '\$ ${controller.totalReal.value.toPrecision(2)}')
                  .paddingOnly(top: 10),
            ],
          ),
        )));
  }

  Widget _cardObservation(BuildContext context) {
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
                "Observaciones",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ).paddingOnly(top: 5),
              _editextObservation(controller.difference.value, context,
                      "Diferencia sin adeudos", 1, 1)
                  .paddingOnly(top: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _label("Faltante empleado",
                            '\$ ${controller.missingEmployee.value.toPrecision(2)}')
                        .paddingOnly(right: 5),
                  ),
                  Expanded(
                      child: _label("Diferencia real porcentaje",
                              '\% ${controller.differencePercentage.value.toPrecision(2)}')
                          .paddingOnly(left: 5)),
                ],
              ).paddingOnly(top: 10),
              _editextObservation(controller.observation.value, context,
                      "Observaciones", 2, 3)
                  .paddingOnly(top: 15),
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

  Widget _editextRetreats(
      TextEditingController control, BuildContext context, String label) {
    return TextField(
      onChanged: (text) => controller.subTotRetreats(text),
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

  Widget _editextObservation(TextEditingController control,
      BuildContext context, String label, int linesMin, int linesMax) {
    return TextField(
      obscureText: false,
      controller: control,
      minLines: linesMin,
      maxLines: linesMax,
      cursorColor: Theme.of(context).hoverColor,
      onChanged: (text) => controller.sumObservation(text),
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

  Widget _date(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var datePickedValue = (await DatePicker.showSimpleDatePicker(
          context,
          titleText: 'Selecciona una fecha',
          initialDate: DateTime.now().add(Duration(days: -1)),
          firstDate: DateTime.now().add(Duration(days: -2190)),
          lastDate: DateTime.now().add(Duration(days: -1)),
          dateFormat: "yyyy-MM-dd",
          locale: DatePicker.localeFromString("es"),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          reverse: true,
          itemTextStyle: context.isTablet
              ? Theme.of(context).textTheme.caption
              : Theme.of(context).textTheme.subtitle2,
          cancelText: 'Cancelar',
          confirmText: 'Aceptar',
          textColor: Theme.of(context).highlightColor,
        ));
        // ignore: unnecessary_null_comparison
        if (datePickedValue != null) {
          controller.date.value =
              datePickedValue.toString().split(' ')[0].trim();
          controller.getDeposit(
              controller.selectedBranchId.value, controller.date.value);
        } else {
          controller.date.value = 'Ingresa una fecha';
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: CustomContainer(labelText: "Fecha", children: [
              Text("${controller.date.value}",
                  style: Theme.of(context).textTheme.subtitle1),
            ]),
          ),
        ],
      ),
    );
  }
}
