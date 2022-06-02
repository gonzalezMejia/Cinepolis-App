import 'package:cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:cinepolis/data/models/entities/products/shopping_product.model.dart';
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
            children: [
              _getTickets(context),
              _getProducts(context)
            ],
          );
        })
    );
  }

  _getTickets(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("BOLETOS",textAlign: TextAlign.start ,style: Theme.of(context).textTheme.subtitle1),
        Container(
          child: ListView(
            children: controller.tickets.map((element) => TicketsItem(element)).toList(),
            shrinkWrap: true,
          ).paddingAll(10),
        ),
      ],
    );
  }

  _getProducts(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("PRODUCTOS",textAlign: TextAlign.start, style: Theme.of(context).textTheme.subtitle1),
        Container(
          child: ListView(
            children: controller.products.map((element) => ProductItem(element)).toList(),
            shrinkWrap: true,
          ).paddingAll(10),
        ),
      ],
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
            width: MediaQuery.of(context).size.width,
            height: 200,
            fit: BoxFit.cover))
        .paddingAll(5);
  }
}

class ProductItem  extends StatelessWidget{
  final ShoppingProductModel element;
  ProductItem(this.element);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(element.productos!.first.producto!, style: Theme.of(context).textTheme.subtitle1),
      leading: _imageContain(context,element.productos!.first.photo!),


    );
  }

  Widget _imageContain(BuildContext context, String url) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Image.network(url,
            width: MediaQuery.of(context).size.width,
            height: 200,
            fit: BoxFit.cover))
        .paddingAll(5);
  }


}
