import 'package:Cinepolis/app/pages/quizzer/availables/quizz/quizz_answers.controller.dart';
import 'package:Cinepolis/app/widgets/image_detail.widget/evidence-image-detail.widget.dart';
import 'package:Cinepolis/app/widgets/image_detail.widget/evidence_image.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomEvidence extends GetView<QuizzerAnswersController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_counterEvidence(context), _evidencesWidget(context)],
      );
    });
  }

  Widget _counterEvidence(BuildContext context) {
    return Text(
      "Evidencias (${controller.quantityArray.value} / ${controller.quizzerData.value.object!.maxValueFiles})",
      style: TextStyle(color: Colors.grey, fontSize: 15),
    ).paddingOnly(left: 25);
  }

  Widget _evidencesWidget(BuildContext context) {
    return Column(children: [
      Center(
          child: RawMaterialButton(
        onPressed: () => controller.takeImage(context),
        elevation: 2.0,
        fillColor: Theme.of(context).hoverColor,
        child: Icon(
          Icons.add_a_photo,
          size: 35.0,
          color: Theme.of(context).primaryColor,
        ),
        padding: EdgeInsets.all(25.0),
        shape: CircleBorder(),
      ).paddingOnly(top: 10, bottom: 10)),
      controller.quizzerData.value.files!.length == 0
          ? Container()
          : _evidencesGridWidget(context)
    ]);
  }

  Widget _evidencesGridWidget(BuildContext context) {
    return controller.imagesLoading.value
        ? Center(child: CircularProgressIndicator())
        : GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: controller.quizzerData.value.files!.length,
            itemBuilder: (BuildContext context, int index) {
              return EvidenceImage(
                  item:
                      '${controller.imagesUrl}/${controller.quizzerData.value.files![index].fileManagerName}',
                  onPressed: () {
                    Get.to(() => ImageDetail(
                        onDelete: () => controller.deleteEvidence(
                            controller.quizzerData.value.files![index]),
                        evidence: controller.quizzerData.value.files![index]));
                  });
            });
  }
}
