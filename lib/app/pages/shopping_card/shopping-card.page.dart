import 'dart:convert';
import 'package:cinepolis/app/pages/shopping_card/widgets/products_shopping.item.widget.dart';
import 'package:cinepolis/app/pages/shopping_card/widgets/tickets_shopping.item.widget.dart';
import 'package:cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis/app/widgets/custom_button/custom_button_large.widget.dart';
import 'package:cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:cinepolis/core/routes/pages.dart';
import 'package:cinepolis/data/models/entities/tickets/shopping_ticket.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'shopping-card.controller.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
  const ShoppingCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppBar(title: "Mi Carrito"),
        body: Obx(() {
          return controller.loading.value
              ? const Center(child: ProgressPrimary())
              : ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _getTickets(context),
              _getProducts(context),
              Visibility(
                replacement: CustomButtonLarge(text: "Pagar Todo",onPressed: ()=>controller.onPayment()),
                  visible:  controller.tickets.isEmpty && controller.products.isEmpty,
                  child: Text("¡AUN NO HAY NADA POR AQUÍ!",textAlign: TextAlign.center, style: Theme.of(context).textTheme.overline))
            ],
          );
        })
    );
  }

  _getTickets(BuildContext context) {
    return Visibility(
      visible: controller.tickets.isNotEmpty,
      child: ListView(
        shrinkWrap: true,
        children: [
          Text("BOLETOS",textAlign: TextAlign.start ,style: Theme.of(context).textTheme.overline).paddingOnly(left: 25,top: 25),
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: controller.tickets.map((element) => TicketsShoppingItem(element,()=>Get.toNamed("${Routes.movieDetail}?model=${json.encode(element.horarios!.pelicula!.toJson())}"))).toList(),
          ).paddingAll(10),
        ],
      ),
    );
  }

  _getProducts(BuildContext context) {
    return Visibility(
      visible: controller.products.isNotEmpty,
      child: ListView(
        shrinkWrap: true,
        children: [
          Text("PRODUCTOS",textAlign: TextAlign.start, style: Theme.of(context).textTheme.overline).paddingOnly(left: 25,top: 25),
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: controller.products.map((element) => ProductsShoppingItem(element.productos!.first,()=>element.productos!.first)).toList(),
            shrinkWrap: true,
          ).paddingAll(10),
        ],
      ),
    );
  }
}


class TicketsItem  extends StatelessWidget{
  final ShoppingTicketModel element;
  TicketsItem(this.element);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(element.horarios!.pelicula!.nombre!, style: Theme.of(context).textTheme.subtitle1),
      leading: _imageContain(context,element.horarios!.pelicula!.photo!),


    );
  }

  Widget _imageContain(BuildContext context, String url) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Image.network(url,
           // width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover))
        .paddingAll(5);
  }
}