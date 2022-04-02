import 'package:Cinepolis/app/pages/audit/rotisserie_inventory/inventory_list/rotisserie_inventory.controller.dart';
import 'package:Cinepolis/app/pages/audit/rotisserie_inventory/inventory_list/widget/rostisserie_tem.widget.dart';
import 'package:Cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:Cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:Cinepolis/data/models/entities/branches/branch.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RotisserieInventoryPage extends GetView<RotisserieInventoryController> {
  final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppBar(
          title: "Inventario de Rosticería",
          actions: [
            IconButton(
                onPressed: () => controller.onNewInventory(),
                icon: Icon(
                  Icons.add,
                  size: 35,
                ))
          ],
        ),
        body: Obx(() => controller.loading.value
            ? Center(child: ProgressPrimary())
            : Column(
                children: [
                  _branchesWidget(context).paddingAll(15),
                  Flexible(
                    child: controller.loading.value
                        ? Center(child: ProgressPrimary())
                        : ListView(
                            physics: BouncingScrollPhysics(),
                            children: [
                              controller.selectBranchId.value > 0
                                  ? _listWidget(context)
                                  : Center(
                                      child: Text(
                                        "SELECCIONA UNA SUCURSAL",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ).paddingOnly(top: 15)
                            ],
                          ),
                  )
                ],
              )));
  }

  Widget _branchesWidget(BuildContext context) {
    return TypeAheadField<Branch?>(
      textFieldConfiguration: TextFieldConfiguration(
          autofocus: true,
          style: Theme.of(context).textTheme.subtitle2,
          controller: controller.textController.value,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () => controller.textController.value.text = ""),
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
        controller.onBranchSelect(suggestion!.idUnidadOperativa);
        controller.textController.value.text =
            "${suggestion.idUnidadOperativa} - ${suggestion.descripcion}";
      },
    );
  }

  Widget _listWidget(BuildContext context) {
    return controller.loading.value
        ? Center(child: ProgressPrimary())
        : Visibility(
            visible: controller.rostisserieBalance.isNotEmpty,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.rostisserieBalance.length,
                itemBuilder: (_, i) {
                  return RostisserieInventoryItem(
                      controller.rostisserieBalance[i].id!,
                      controller.rostisserieBalance[i].branchId!,
                      controller.rostisserieBalance[i].date!,
                      () => controller.getToDetails(
                          controller.rostisserieBalance[i].toJson()));
                }),
            replacement: Center(
                child: Text(
              "NO HAY DATOS A MOSTRAR",
              style: Theme.of(context).textTheme.subtitle1,
            )),
          );
  }
}
