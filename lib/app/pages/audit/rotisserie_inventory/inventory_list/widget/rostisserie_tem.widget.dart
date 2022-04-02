import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class RostisserieInventoryItem extends StatelessWidget {
  final int folio;
  final int branch;
  final DateTime date;
  final GestureTapCallback onPress;
  final DateFormat formatter = DateFormat('dd-MM-yyyy  hh:mm aa');

  RostisserieInventoryItem(this.folio, this.branch, this.date, this.onPress);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.grey[600]!),
          ListTile(
            title: _textPlain(context, "Folio: $folio"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // ignore: unnecessary_null_comparison
                _subtitle(context, "Sucursal: $branch"),
                _subtitle(context, 'Fecha: ${formatter.format(date)}').paddingOnly(top: 5),
              ],
            ).paddingOnly(top: 10, bottom: 5),
          ),
        ],
      ),
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
