import 'package:cinepolis/app/pages/payment/payment.controller.dart';
import 'package:cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentPage extends GetView<PaymentController>{
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: "",),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.4,
            child:ListView(
            children: controller.paymentModel.value.tickets.map((e) => _itemPayment(context, e.horarios!.pelicula!.nombre!,e.asientos!.map((e){ var x= 0.0;
              x=x+e.costo!;
            return x;}).first
            )).toList(),
          ),),
          SizedBox(
            height: MediaQuery.of(context).size.height*.4,
            child:ListView(
              children: controller.paymentModel.value.products.map((e) => _itemPayment(context, e.productos!.first.producto!, e.productos!.first.precioV!)).toList(),
            ),),
          Text(controller.paymentModel.value.total.toString(),style: Theme.of(context).textTheme.subtitle1)
        ],
      ),
    );
  }

  Widget _itemPayment(BuildContext context, title, double price){
    return Column(
      children: [
        const Divider(height: 2,endIndent: 5,indent: 5,thickness: 1,color: Colors.black54),
        Card(
          color: Colors.grey,
          child: ListTile(
            title: Text(title,style: Theme.of(context).textTheme.subtitle1),
            subtitle: Text("\$$price",style: Theme.of(context).textTheme.subtitle1),

          ),
        ),
      ],
    );
  }
}

