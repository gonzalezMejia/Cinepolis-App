import 'package:cinepolis/app/pages/candy_store/candy_store.controller.dart';
import 'package:cinepolis/app/pages/candy_store/detail/detail.page.dart';
import 'package:cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CandyStorePage extends GetView<CandyStoreController> {
  const CandyStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: "Dulcería"),
      body: Obx(() => controller.loading.value
          ? const Center(child: ProgressPrimary())
          : ListView(
              children: [_listCandyWidget(context)],
            )),
    );
  }

  Widget _listCandyWidget(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.products.length,
        clipBehavior: Clip.antiAlias,
        itemBuilder: (_, i) {
          return ProductsItem(controller.products[i]);
        });
  }
}
