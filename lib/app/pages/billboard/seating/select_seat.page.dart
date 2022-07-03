import 'package:cinepolis/app/pages/billboard/seating/seating.controller.dart';
import 'package:cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis/app/widgets/custom_button/custom_button_large.widget.dart';
import 'package:cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectSeatPage extends GetView<SeatingController>{

  const SelectSeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: "Asientos"),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: context.mediaQueryPadding.top),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    ItemStatus(status: 'Disponibles', color: Colors.white10,value: controller.availableLocation.value.capacidad!.toString()),
                    const ItemStatus(status: 'Ocupados', color: Color(0xFFFF8B2D)),
                    const ItemStatus(status: 'Adultos', color:  Color(0xFF656CEE)),
                    const ItemStatus(status: 'Niños', color: Colors.blueAccent),
                  ],
                ),
              ),
              Expanded(
                child: Obx(
                      () => controller.loading.value?
                          const ProgressPrimary()
                          :GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 5,
                    ),
                    itemCount: controller
                        .gerbong
                        .length,
                    itemBuilder: (context, index) =>
                        GestureDetector(
                          onTap: () =>
                              controller.selectKursi(index),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: controller.gerbong
                              [index]["status"] ==
                                  "available"
                                  ? Colors.white10
                                  : controller.gerbong[index]
                              ["status"] == "filled"
                                  ? const Color(0xFFFF8B2D)
                                  :  controller.gerbong[index]
                              ["status"] == "selected"?const Color(0xFF656CEE):
                              Colors.blueAccent,
                              border: Border.all(
                                  color: Colors.black12),
                              borderRadius:
                              BorderRadius.circular(10),
                            ),
                          ),
                        ),
                  ),
                ),
              ),
              SizedBox(height: context.mediaQueryPadding.top),
              CustomButtonLarge(
                text: "Continuar",
                onPressed: ()=>controller.onSaveListSeat(context),
              ).paddingOnly(bottom: 10)
            ],
          )
        ],
      ),
    );
  }
}

class ItemStatus extends StatelessWidget {
  const ItemStatus({
    Key? key,
    required this.status,
    required this.color,
    this.value=""
  }) : super(key: key);

  final String status;
  final Color color;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            border:  Border.all(
            ),
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 7),
        Text(
          status,
          style: const TextStyle(fontSize: 14,color: Colors.black54),
        ),
      ],
    );
  }
}