import 'package:Cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:Cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_available.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'availables.controller.dart';

class QuizzerAvailablePage extends GetView<QuizzerAvailableController> {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: "Disponibles",
      ),
      body: Container(child: Obx(() {
        return controller.loading.value
            ? Center(child: ProgressPrimary())
            : controller.quizzes.isEmpty
                ? Center(
                    child: Text(
                    "NO HAY ENCUESTAS DISPONIBLES",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .apply(fontWeightDelta: FontWeight.bold.index),
                  ))
                : ListView(
                    physics: BouncingScrollPhysics(),
                    children: controller.quizzes
                        .map((item) => _quizzItemWidget(context, item))
                        .toList());
      })),
    );
  }

  Widget _quizzItemWidget(BuildContext context, QuizzAvailable quizz) {
    return Column(children: [
      ListTile(
        onTap: () => controller.goToDetail(quizz),
        title: Text(quizz.quizName,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.subtitle1),
        subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quizz.quizDescription,
                style: context.isTablet
                    ? Theme.of(context).textTheme.headline6
                    : Theme.of(context).textTheme.headline5,
              ).paddingSymmetric(vertical: 10),
              _textWhitIcon(context, Icons.hourglass_empty,
                  '${formatter.format(DateTime.parse(quizz.visualizationBeginDate))} - ${formatter.format(DateTime.parse(quizz.visualizationEndDate))}'),
              _textWhitIcon(
                  context, Icons.label_important_outline, quizz.campaignName),
              _textWhitIcon(
                  context, Icons.account_circle_outlined, quizz.quizTypeName)
            ]),
        trailing: Container(
            height: double.infinity,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).iconTheme.color,
            )),
      ),
      Divider(thickness: 2, indent: 10, endIndent: 10, color: Colors.grey[600]!)
    ]);
  }

  Widget _textWhitIcon(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon,
                size: 15,
                color: Theme.of(context).inputDecorationTheme.focusColor)
            .paddingOnly(right: 8),
        Text(text,
            style: context.isTablet
                ? Theme.of(context).textTheme.headline6
                : Theme.of(context).textTheme.headline5),
      ],
    );
  }
}
