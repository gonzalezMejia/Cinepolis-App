import 'package:Cinepolis/app/pages/main/home/home.page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomePage());
  }
}
