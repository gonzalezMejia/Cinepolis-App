import 'package:Cinepolis/app/pages/quizzer/availables/quizz/quizz_answers.controller.dart';
import 'package:Cinepolis/app/widgets/custom_button/custom_button_large.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizzerFinishPage extends GetView<QuizzerAnswersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          await controller.completeQuizzer();
          return Future.value(true);
        },
        child: Column(
          children: [
            Center(
                child: Image.asset('assets/images/logo_esp.jpeg')
                    .paddingOnly(top: 136, bottom: 40)),
            Text('Encuesta concluida!',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Hind',
                        fontWeight: FontWeight.bold))
                .marginSymmetric(vertical: 10),
            Text(
              'Gracias, tu participación es importante para nosotros.',
              style: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
              textAlign: TextAlign.center,
            ).marginSymmetric(vertical: 10).paddingOnly(left: 6, right: 6),
            Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: CustomButtonLarge(
                        text: 'Encuestas Disponibles',
                        color: Theme.of(context).primaryColor,
                        onPressed: () => controller.completeQuizzer()))
                .paddingOnly(top: 96, bottom: 10),
          ],
        ),
      ),
    );
  }
}
