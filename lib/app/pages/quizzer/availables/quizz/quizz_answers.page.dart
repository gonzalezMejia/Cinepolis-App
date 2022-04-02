import 'package:Cinepolis/app/pages/quizzer/availables/quizz/widgets/optional/comments.widget.dart';
import 'package:Cinepolis/app/pages/quizzer/availables/quizz/widgets/survey_objects/custom_evidences.widget.dart';
import 'package:Cinepolis/app/pages/quizzer/availables/quizz/widgets/survey_objects/custom_text.widget.dart';
import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/app/widgets/custom_button/custom_button_large.widget.dart';
import 'package:Cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:Cinepolis/app/widgets/progress/progress_liner.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'quizz_answers.controller.dart';

class QuizzerAnswersPage extends GetView<QuizzerAnswersController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        MsgUtils.confirm(context, '¿Seguro quieres cancelar la encuesta?',
            () => controller.cancelationQuizzer(), () => {Get.back()});
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          title: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Text(
                  "Preguntas",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text("${controller.quizzerData.value.questionNumber}",
                    style: TextStyle(color: Colors.white, fontSize: 13))
              ],
            );
          }),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios_new_outlined),
            onTap: () => MsgUtils.confirm(
                context,
                '¿Seguro quieres cancelar la encuesta?',
                () => controller.cancelationQuizzer(),
                () => {Get.back()}),
          ),
        ),
        body: Obx(() {
          return controller.quizzerData.value.isCompleted == false
              ? controller.loading.value
                  ? ProgressPrimary()
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          controller.loadingSave.value
                              ? ProgressLinerPrymary()
                              : Container(),
                          controller.quizzerData.value.label == null
                              ? Container()
                              : CustomText().paddingOnly(top: 20, bottom: 20),
                          controller.selectedWidget.paddingOnly(bottom: 15),
                          controller.quizzerData.value.object!
                                      .allowObservations ==
                                  false
                              ? Container()
                              : OptionalComments()
                                  .paddingOnly(top: 10, bottom: 15),
                          controller.quizzerData.value.object!.allowFiles ==
                                  false
                              ? Container()
                              : CustomEvidence(),
                          CustomButtonLarge(
                                  color: Theme.of(context).primaryColor,
                                  text: 'Siguiente',
                                  onPressed: () => controller.saveRequest())
                              .paddingAll(20.0),
                        ],
                      ),
                    )
              : Container();
        }),
      ),
    );
  }
}
