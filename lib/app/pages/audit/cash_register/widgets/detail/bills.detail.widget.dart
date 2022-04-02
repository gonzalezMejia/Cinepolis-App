import 'package:Cinepolis/app/pages/audit/cash_register/cash_register.controller.dart';
import 'package:Cinepolis/data/models/entities/audit/cash_balances_detail.model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:intl/intl.dart';

class BillsDetail extends StatelessWidget {
  final CashBalancesDetail balancesDetail;
  final List<Bills> listBills;
  final List<Bills> listCoins;

  BillsDetail(
    this.balancesDetail,
    this.listBills,
    this.listCoins,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(shrinkWrap: true, children: [
      Container(
          color: Colors.white38,
          padding: EdgeInsets.all(10),
          child: Text(
            "Billetes:",
            style: Theme.of(context).textTheme.subtitle1,
          )),
      Padding(
          padding: EdgeInsets.all(10),
          child: _contentTable(
              context,
              listBills,
              _customContainer(context, balancesDetail.totalGuardB!,
                  balancesDetail.totalB!))),
      Container(
          color: Colors.white38,
          padding: EdgeInsets.all(10),
          child: Text(
            "Monedas:",
            style: Theme.of(context).textTheme.subtitle1,
          )),
      Padding(
          padding: EdgeInsets.all(10),
          child: _contentTable(
              context,
              listCoins,
              _customContainer(context, balancesDetail.totalGuardC!,
                  balancesDetail.totalC!)))
    ]));
  }

  _customContainer(BuildContext context, double total, double totalGuard) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _textContent(context, 'Total: ', total),
        _textContent(context, 'Gran Total: ', totalGuard),
      ],
    );
  }

  Widget _textContent(BuildContext context, String title, double content) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14.5),
          ),
          Text(
            NumberFormat.simpleCurrency(locale: "es_MX").format(content),
            style: TextStyle(fontSize: 14.5),
          )
        ],
      ),
    );
  }

  _contentTable(BuildContext context, List<Bills> list, Widget widget) {
    return SfDataGrid(
      source: EmployeeDataSource(bills: list),
      shrinkWrapColumns: true,
      shrinkWrapRows: true,
      footer: widget,
      verticalScrollPhysics: BouncingScrollPhysics(),
      horizontalScrollPhysics: NeverScrollableScrollPhysics(),
      columns: [
        GridColumn(
            width: MediaQuery.of(context).size.width * .321,
            columnName: 'den',
            label: Text('Denominación'),
            columnWidthMode: ColumnWidthMode.auto),
        GridColumn(
            width: MediaQuery.of(context).size.width * .321,
            columnName: 'Res',
            label: Text('Resguardo'),
            columnWidthMode: ColumnWidthMode.auto),
        GridColumn(
            width: MediaQuery.of(context).size.width * .321,
            columnName: 'Cja',
            label: Text('Caja'),
            columnWidthMode: ColumnWidthMode.auto),
      ],
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<Bills> bills}) {
    _bills = bills
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'den', value: e.denomination),
              DataGridCell<double>(columnName: 'Res', value: e.guard),
              DataGridCell<int>(columnName: 'Cja', value: e.box),
            ]))
        .toList();
  }
  List<DataGridRow> _bills = [];

  @override
  List<DataGridRow> get rows => _bills;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}
