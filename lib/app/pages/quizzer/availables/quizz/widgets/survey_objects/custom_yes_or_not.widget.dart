import 'package:Cinepolis/app/pages/quizzer/availables/quizz/quizz_answers.controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomYesOrNot extends GetView<QuizzerAnswersController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _btnLike(),
          _btnNotLike(),
        ],
      );
    });
  }

  Widget _btnLike() {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Ink(
        decoration: ShapeDecoration(
            color: controller.changeColor.first.shade500,
            shape: CircleBorder(),
            shadows: [
              const BoxShadow(
                color: Colors.white,
              ),
              BoxShadow(
                color: controller.changeColor.first.shade500,
                spreadRadius: -45.0,
                blurRadius: 40.0,
              ),
            ]),
        child: IconButton(
          onPressed: () {
            controller.btnYes();
          },
          icon: FaIcon(
            FontAwesomeIcons.solidThumbsUp,
            color: Colors.white,
          ),
          iconSize: 25.0,
        ),
      ),
    );
  }

  Widget _btnNotLike() {
    return Ink(
      decoration: ShapeDecoration(
          color: controller.changeColor.last.shade500,
          shape: CircleBorder(),
          shadows: [
            const BoxShadow(
              color: Colors.white,
            ),
            BoxShadow(
              color: controller.changeColor.last.shade500,
              spreadRadius: -45.0,
              blurRadius: 40.0,
            ),
          ]),
      child: IconButton(
        onPressed: () => controller.btnNot(),
        icon: FaIcon(
          FontAwesomeIcons.solidThumbsDown,
          color: Colors.white,
        ),
        iconSize: 25.0,
      ),
    );
  }
}
