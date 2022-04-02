import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

// ignore: must_be_immutable
class RostisserieInventoryItemDetail extends StatelessWidget {
  var producto;
  var totalSystem;
  var physicalExistence;
  var pendingChanges;
  var difference;
  var observation;
  double moneyDifferences;

  RostisserieInventoryItemDetail(
      this.producto,
      this.totalSystem,
      this.physicalExistence,
      this.pendingChanges,
      this.difference,
      this.observation,
      this.moneyDifferences);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: _textPlain(context, producto),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: _subtitle(context, "Total Sistema: $totalSystem")),
                  Flexible(
                      child:
                          _subtitle(context, 'Existencia: $physicalExistence')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: _subtitle(
                          context, "Cambios Pendientes: $pendingChanges")),
                  Flexible(
                      child: _subtitle(context, 'Diferencias: $difference')),
                ],
              ).paddingOnly(top: 5),
              _subtitle(context, "Observaciones: $observation")
                  .paddingOnly(top: 5),
              _subtitle(context, "Diferencia de Dinero: \$ $moneyDifferences")
                  .paddingOnly(top: 5),
            ],
          ).paddingOnly(top: 10, bottom: 5),
        ),
        Divider(
            thickness: 2, indent: 20, endIndent: 20, color: Colors.grey[600]!),
      ],
    );
  }

  Text _textPlain(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .subtitle2!
          .apply(fontWeightDelta: FontWeight.bold.index),
      softWrap: false,
    );
  }

  Widget _subtitle(BuildContext context, String text) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.fade,
        maxLines: 1,
        softWrap: false,
        textWidthBasis: TextWidthBasis.parent,
      ),
    );
  }
}
