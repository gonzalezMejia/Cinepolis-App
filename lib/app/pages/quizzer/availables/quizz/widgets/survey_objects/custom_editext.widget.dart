import 'package:Cinepolis/app/pages/quizzer/availables/quizz/quizz_answers.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomEditText extends GetView<QuizzerAnswersController> {
  @override
  Widget build(BuildContext context) {
    return Center(child: _editext(context).paddingOnly(left: 20, right: 20));
  }

  Widget _editext(BuildContext context) {
    return Obx(() => TextField(
        obscureText: false,
        controller: controller.customEditext.value,
        keyboardType: controller.textInputType,
        maxLines: 3,
        onChanged: controller.changeStatus(),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: controller.hintLabel.value,
        )));
  }
}
