import 'package:Cinepolis/app/pages/quizzer/availables/availables.controller.dart';
import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:Cinepolis/app/widgets/custom_button/custom_button_large.widget.dart';
import 'package:Cinepolis/app/widgets/custom_dropdown.widget/Dropdown_custom.widget.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz_available.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class QuizzerAvailableDetailPage extends GetView<QuizzerAvailableController> {
  final QuizzAvailable quizz;
  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  QuizzerAvailableDetailPage(this.quizz);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: "Detalle"),
      body: Obx(() {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _description(context),
                  _branchesWidget().paddingOnly(bottom: 20),
                  _textPlain(context, 'Alcance', quizz.quizScopeName)
                      .paddingOnly(bottom: 15),
                  _textPlain(context, 'Categoria', quizz.quizTypeName)
                      .paddingOnly(bottom: 15),
                  _textPlain(
                          context,
                          'Inicio',
                          formatter.format(
                              DateTime.parse(quizz.visualizationBeginDate)))
                      .paddingOnly(bottom: 15),
                  _textPlain(
                          context,
                          'Vencimiento',
                          formatter.format(
                              DateTime.parse(quizz.visualizationEndDate)))
                      .paddingOnly(bottom: 15)
                ],
              ),
              _buttonStart(context).paddingOnly(top: 15)
            ],
          ),
        ).paddingAll(20);
      }),
    );
  }

  Widget _description(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descripción',
          style: TextStyle(
              color: Theme.of(context).hoverColor,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        Text('${quizz.quizDescription}',
            style: TextStyle(
              color: Theme.of(context).hoverColor,
              fontSize: 14,
            )).paddingOnly(top: 15),
      ],
    );
  }

  Widget _branchesWidget() {
    return CustomDropDown(
        text: "Sucursal",
        onchange: (value) => controller.changeBranch(value!),
        selectedId: controller.currentBranch.value,
        listDynamic: controller.availableBranches
            .map((e) => DropdownMenuItem(
                value: e.id, child: Text('${e.internalCode} -${e.name}')))
            .toList());
  }

  Widget _textPlain(BuildContext context, String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
                style: (context.isTablet
                        ? Theme.of(context).textTheme.headline2
                        : Theme.of(context).textTheme.subtitle1)!
                    .apply(fontWeightDelta: FontWeight.bold.index))
            .paddingOnly(bottom: 15),
        Text(text,
            style: context.isTablet
                ? Theme.of(context).textTheme.subtitle2
                : Theme.of(context).textTheme.headline4),
      ],
    );
  }

  Widget _buttonStart(BuildContext context) => CustomButtonLarge(
      text: 'Iniciar',
      color: Theme.of(context).primaryColor,
      onPressed: () => MsgUtils.confirm(
          context,
          '¿Seguro quieres iniciar la encuesta?',
          () => controller.startSurvey(),
          () => {Get.back()}));
}
