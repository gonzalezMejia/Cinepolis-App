import 'package:Cinepolis/app/pages/quizzer/availables/quizz/quizz_answers.controller.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMultipleChoice extends GetView<QuizzerAnswersController> {
  final Option object;

  CustomMultipleChoice(this.object);

  @override
  Widget build(BuildContext context) {
    return _multipleChoice(context);
  }

  Widget _multipleChoice(BuildContext context) {
    return Obx(() {
      return ListTile(
        title: Text('${object.label}',
            style: Theme.of(context).textTheme.subtitle1),
        leading: Radio(
          value: int.parse(object.id.toString()),
          groupValue: controller.valueChoise.value,
          activeColor: Color(0xFF6200EE),
          onChanged: (value) {
            controller.valueChoise.value = int.parse(value.toString());
            print(controller.valueChoise.value);
          },
        ),
      );
    });
  }
}
