import 'package:Cinepolis/app/pages/quizzer/availables/quizz/quizz_answers.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomText extends GetView<QuizzerAnswersController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _text(context),
      ],
    );
  }

  Widget _text(BuildContext context) {
    return Obx(() {
      return Text(
        controller.customText.value,
        style: TextStyle(color: Theme.of(context).hoverColor, fontSize: 17),
        textAlign: TextAlign.center,
      ).paddingOnly(left: 20, right: 20);
    });
  }
}
