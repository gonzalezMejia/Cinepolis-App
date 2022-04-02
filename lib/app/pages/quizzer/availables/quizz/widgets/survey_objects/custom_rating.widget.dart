import 'package:Cinepolis/app/pages/quizzer/availables/quizz/quizz_answers.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomRating extends GetView<QuizzerAnswersController> {
  @override
  Widget build(BuildContext context) {
    return Center(child: _rating(context));
  }

  Widget _rating(BuildContext context) {
    return RatingBar.builder(
      initialRating: 1,
      minRating: double.parse(
          controller.quizzerData.value.object!.minRateValue.toString()),
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: int.parse(
          controller.quizzerData.value.object!.maxRateValue.toString()),
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => FaIcon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) => controller.rating.value = rating,
    );
  }
}
