import 'package:Cinepolis/app/pages/candy_store/candy_store.controller.dart';
import 'package:Cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CandyStorePage extends GetView<CandyStoreController>{
  const CandyStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: SimpleAppBar(title: "Dulcería"),

  body: ListView(children: controller.products.map((element) => Text(element.producto!,style: TextStyle(color: Colors.white),)).toList()),
);
  }


}