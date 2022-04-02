import 'package:Cinepolis/app/pages/quizzer/availables/quizz/quizz_answers.controller.dart';
import 'package:Cinepolis/data/models/entities/quizzer/quizz.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMultipleOptions extends GetView<QuizzerAnswersController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_multipleOptions(context)],
    );
  }

  Widget _multipleOptions(BuildContext context) {
    return new ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: <Widget>[
        new Container(
          child: new ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return new Column(
                children: <Widget>[
                  new Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: new ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount:
                          controller.quizzerData.value.object!.options!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Obx(() {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 3.0,
                              color: controller.validationColor[index]
                                  ? Colors.amber[400]
                                  : null,
                              child: new Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.center,
                                child: new Text(
                                  '${controller.quizzerData.value.object!.options![index].label}',
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center,
                                ).paddingAll(10.0),
                              ),
                            ).paddingOnly(top: 5, left: 20, right: 20);
                          }),
                          onTap: () {
                            controller.validationColor[index] =
                                !controller.validationColor[index];

                            if (controller.validationColor[index] == true) {
                              controller.listItems.add(Option(
                                  id: controller.quizzerData.value.object!
                                      .options![index].id,
                                  label: controller.quizzerData.value.object!
                                      .options![index].label));
                            } else {
                              controller.listItems.remove(index);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
