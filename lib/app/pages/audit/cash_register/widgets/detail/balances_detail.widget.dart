import 'package:Cinepolis/app/widgets/custom_container/custom_container.widget.dart';
import 'package:Cinepolis/data/models/entities/audit/cash_balances_detail.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceDetail extends StatelessWidget {
  final CashBalancesDetail balancesDetail;

  BalanceDetail(this.balancesDetail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: CustomContainer(
                labelText: 'Resguardo sin Acceso a Cofre de Valores',
                children: [
                  _textContent(context, 'Depositos Pendientes de Enviar',
                      balancesDetail.cashBalanceChest!.pendingDeposit!),
                  _textContent(context, 'Depositos de Día',
                      balancesDetail.cashBalanceChest!.yesterdayDeposit!),
                  _textContent(context, 'Retiros de Ayer y Anteriores',
                      balancesDetail.cashBalanceChest!.yesterdayWithdrawal!),
                  _textContent(context, 'Depositos a Completar',
                      balancesDetail.cashBalanceChest!.depositToComplete!),
                ]),
          ),
          Divider(
              thickness: 3,
              indent: 20,
              endIndent: 20,
              color: Colors.grey[600]!),
          Padding(
            padding: EdgeInsets.all(10),
            child: CustomContainer(labelText: 'Caja', children: [
              _textContent(context, 'Depositos a Completar',
                  balancesDetail.cashBalanceCash!.depositToComplete!),
              _textContent(context, 'Total Venta del Día',
                  balancesDetail.cashBalanceCash!.totalSales!),
              _textContent(context, 'Cambio de Apertura',
                  balancesDetail.cashBalanceCash!.initialBalance!),
              _textContent(context, 'Total de Caja',
                  balancesDetail.cashBalanceCash!.total!),
            ]),
          ),
          Divider(
              thickness: 3,
              indent: 20,
              endIndent: 20,
              color: Colors.grey[600]!),
          Padding(
            padding: EdgeInsets.all(10),
            child: CustomContainer(labelText: 'Retiros', children: [
              _textContent(context, 'Retiros del Día',
                  balancesDetail.cashBalanceWithdrawal!.dayWithdrawals!),
              _textContent(context, 'Mensajería y/o Adtvo',
                  balancesDetail.cashBalanceWithdrawal!.administrativeExpense!),
              _textContent(context, 'Moneda en Cofre de Valores',
                  balancesDetail.cashBalanceWithdrawal!.coinInChest!),
              _textContent(context, 'Otros',
                  balancesDetail.cashBalanceWithdrawal!.others!),
              _textContent(context, 'Subtotal',
                  balancesDetail.cashBalanceWithdrawal!.subtotal!),
            ]),
          ),
          Divider(
              thickness: 3,
              indent: 20,
              endIndent: 20,
              color: Colors.grey[600]!),
          Padding(
            padding: EdgeInsets.all(10),
            child: CustomContainer(labelText: 'Totales', children: [
              _textContent(context, 'Total de Efectivo',
                  balancesDetail.cashBalanceTotal!.cashTotal!),
              _textContent(context, 'Total de Gastos',
                  balancesDetail.cashBalanceTotal!.expenseTotal!),
              _textContent(context, 'Total de Voucher',
                  balancesDetail.cashBalanceTotal!.voucherTotal!),
              _textContent(context, 'Total del Arqueo',
                  balancesDetail.cashBalanceTotal!.balanceTotal!),
              _textContent(context, 'Diferencia Real',
                  balancesDetail.cashBalanceTotal!.realDifference!),
            ]),
          ),
          Divider(
              thickness: 3,
              indent: 20,
              endIndent: 20,
              color: Colors.grey[600]!),
          Padding(
            padding: EdgeInsets.all(10),
            child: CustomContainer(labelText: 'Observaciones', children: [
              _textContent(context, 'Faltante en Adeudo Empleado',
                  balancesDetail.employeeDebitMissing!),
              _textPlain(context, 'Diferencia Real',
                  '${balancesDetail.percentageRealDifference}%'),
              _textPlain(context, 'Observaciones', balancesDetail.comments!),
              _textContent(context, 'Diferencia sin Adeudos',
                  balancesDetail.withoutDebitDifference!),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _textPlain(BuildContext context, String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          content,
          softWrap: true,
          overflow: TextOverflow.clip,
          maxLines: 5,
          style: Theme.of(context).textTheme.bodyText2,
        )
      ],
    );
  }

  Widget _textContent(BuildContext context, String title, double content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          NumberFormat.simpleCurrency(locale: "es_MX").format(content),
          style: Theme.of(context).textTheme.bodyText2,
        )
      ],
    );
  }
}
