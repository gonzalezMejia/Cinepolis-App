import 'package:Cinepolis/app/pages/quizzer/history/history.controller.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_history.model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class QuizzerHistoryDetailPage extends GetView<QuizzerHistoryController> {
  final QuizHistory quizz;
  final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');

  QuizzerHistoryDetailPage(this.quizz);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 30),
        decoration: BoxDecoration(
          color: Theme.of(context).indicatorColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _textDetalle(context),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                _textPlainIcon(context, Icons.calendar_today_outlined,
                    formatter.format(quizz.beginDate)),
                _textPlainIcon(
                    context,
                    FontAwesomeIcons.chartBar,
                    controller.quizzesSummary.first.objectsResponseCount
                        .toString()),
              ]).paddingOnly(bottom: 25),
              _textPlainIcon(context, FontAwesomeIcons.clock,
                      formatter.format(DateTime.parse(quizz.endDate)))
                  .paddingOnly(bottom: 25),
              _textPlainIcon(context, FontAwesomeIcons.hourglass,
                  '${controller.quizzesSummary.first.elapsedMinutes} min.')
            ],
          ).paddingAll(10);
        }),
      ),
    );
  }

  Widget _textDetalle(BuildContext context) {
    return Text("Detalle",
            style: TextStyle(color: Theme.of(context).hoverColor, fontSize: 20))
        .paddingOnly(bottom: 30);
  }

  Widget _textPlainIcon(BuildContext context, IconData icon, String text) {
    return controller.loadingSummary.value == false
        ? Row(
            children: [
              Icon(
                icon,
                color: Colors.green,
              ).paddingOnly(right: 10),
              Text(
                text,
                style: TextStyle(
                    color: Theme.of(context).hoverColor, fontSize: 15),
              )
            ],
          )
        : Container(
            child: Text(
              "CARGANDO...",
              style: TextStyle(
                  color: Theme.of(context).hoverColor, fontSize: 12.0),
            ),
          );
  }
}
