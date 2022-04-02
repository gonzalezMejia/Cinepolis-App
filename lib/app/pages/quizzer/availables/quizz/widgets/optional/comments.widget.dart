import 'package:Cinepolis/app/pages/quizzer/availables/quizz/quizz_answers.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionalComments extends GetView<QuizzerAnswersController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _editText(context).paddingOnly(left: 20, right: 20),
      ],
    );
  }

  Widget _editText(BuildContext context) {
    return Obx(() => TextField(
        obscureText: false,
        maxLines: 3,
        controller: controller.customEditext.value,
        onChanged: controller.changeStatus(),
        cursorColor: Theme.of(context).hoverColor,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: controller.hintLabel.value,
          labelStyle: TextStyle(color: Theme.of(context).hoverColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).hoverColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).hoverColor),
          ),
        )));
  }
}
