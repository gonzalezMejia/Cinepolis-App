import 'package:Cinepolis/app/pages/billboard/billboard.controller.dart';
import 'package:Cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillboardPage extends GetView<BillBoardController>{
  const BillboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: "Cartelera"),

    );
  }


}