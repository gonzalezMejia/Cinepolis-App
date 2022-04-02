import 'package:intl/intl.dart';
import 'package:Cinepolis/app/utils/card_status.utils.dart';
import 'package:Cinepolis/data/models/entities/audit/cash_balances.model.dart';
import 'package:flutter/material.dart';

class BalanceItem extends StatelessWidget {
  final CashBalances balanceItem;
  final Function onTap;
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  BalanceItem(this.balanceItem, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Divider(
          thickness: 2, indent: 20, endIndent: 20, color: Colors.grey[600]!),
      GestureDetector(
        onTap: () => onTap(balanceItem, context),
        child: ListTile(
          leading: StatusIndicator.progress(),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${balanceItem.id}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: _subtitle(
                            context, "Sucursal: ${balanceItem.branchId}")),
                    Flexible(
                      child: _subtitle(context,
                          "Fecha: ${formatter.format(DateTime.parse(balanceItem.insertDate!))}"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: _subtitle(
                    context, "Tipo de Negocio: ${balanceItem.businessType}"),
              ),
            ],
          ),
          // leading: StatusCards.progress()
        ),
      ),
    ]);
  }

  Widget _subtitle(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText2,
      overflow: TextOverflow.fade,
      maxLines: 1,
      softWrap: false,
      textWidthBasis: TextWidthBasis.parent,
    );
  }
}
