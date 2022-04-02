import 'package:Cinepolis/app/pages/quizzer/availables/availables.page.dart';
import 'package:Cinepolis/app/pages/quizzer/history/history.page.dart';
import 'package:Cinepolis/data/models/core/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizzerController extends GetxController {
  final List<TabItem> navigationItems = [
    TabItem(Icons.list, QuizzerAvailablePage(), 'Disponibles'),
    TabItem(Icons.access_time_outlined, Center(child: QuizzerHistoryPage()),
        'Historial'),
  ];
}
