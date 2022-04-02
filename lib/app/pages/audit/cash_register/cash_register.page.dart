import 'package:Cinepolis/app/pages/audit/cash_register/cash_register.controller.dart';
import 'package:Cinepolis/app/pages/audit/cash_register/widgets/balances_item.widget.dart';
import 'package:Cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:Cinepolis/app/widgets/custom_dropdown.widget/Dropdown_custom.widget.dart';
import 'package:Cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:Cinepolis/data/models/entities/branches/branch.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class CashRegisterPage extends GetView<CashRegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppBar(
          title: "Arqueos de Caja",
          actions: [
            IconButton(
                onPressed: () => controller.onNewBalance(),
                icon: Icon(
                  Icons.add,
                  size: 35,
                ))
          ],
        ),
        body: Obx(() {
          return Column(children: [
            _businessTypeWidget().paddingOnly(bottom: 15),
            _branchesWidget(context)
                .paddingOnly(left: 20, right: 20, top: 5, bottom: 20),
            controller.loading.value
                ? Center(child: ProgressPrimary())
                : controller.balancesList.isEmpty
                    ? Center(
                        child: Text(
                        "NO HAY ARQUEOS DISPONIBLES",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .apply(fontWeightDelta: FontWeight.bold.index),
                      ))
                    : Flexible(
                        child: ListView(
                                physics: const BouncingScrollPhysics(),
                                children: [_listWidget(context)])
                            .paddingOnly(bottom: 15),
                      ),
          ]);
        }));
  }

  Widget _businessTypeWidget() {
    return CustomDropDown(
        text: "Tipo de Negocio",
        onchange: (value) => controller.getBalances(type: value!),
        selectedId: controller.selectedBusinessId,
        listDynamic: controller.listBusinessType
            .map((e) =>
                DropdownMenuItem(value: e.id, child: Text(e.description)))
            .toList());
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
                    controller.selectedBranchId = 0;
                    controller.searchController.value.text = "";
                    controller.getBalances();
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
        controller.onBranchSelect(suggestion!.idUnidadOperativa);
        controller.searchController.value.text =
            "${suggestion.idUnidadOperativa} - ${suggestion.descripcion}";
      },
    );
  }

  Widget _listWidget(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.balancesList.length,
        clipBehavior: Clip.antiAlias,
        itemBuilder: (_, i) {
          return BalanceItem(
              controller.balancesList[i]!, controller.onBalanceTap);
        });
  }
}
