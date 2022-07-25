import 'package:cinepolis/app/pages/payment/payment.controller.dart';
import 'package:cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis/app/widgets/custom_button/custom_button.widget.dart';
import 'package:cinepolis/app/widgets/custom_dropdown.widget/Dropdown_custom.widget.dart';
import 'package:cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>controller.onClosed(),
      child: Scaffold(
        appBar: SimpleAppBar(title: "Pago",),
        body: Obx(() {
          return controller.loading.value?
              const ProgressPrimary()
              :ListView(
            children: [
              Container(
                color: Colors.grey[300],
                child: SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .3,
                  child: ListView(
                    children: controller.paymentModel.value.tickets.map((e) =>
                        _itemPayment(context, e.horarios!.pelicula!.nombre!,
                            e.asientos!.map((i) {
                            return  _Payment(i.nombreAsiento!, (i.costo!), e.asientos!.length);
                            }).toList()
                        )).toList(),
                  ),),
              ).paddingAll(10),
              Container(
                child: SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .3,
                  child: ListView(
                    children: controller.paymentModel.value.products.map((e) =>
                        _itemPayment(context, e.productos!.first.producto!,
                            e.productos!.map((i) {
                              return  _Payment(i.descripcion!, (i.precioV!), e.productos!.length);
                            }).toList()
                        )).toList()
                  )
                ).paddingAll(10),
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Text("Selecciona tu metodo de Pago",textAlign: TextAlign.start ,style: Theme.of(context).textTheme.overline).paddingOnly(left: 25,top: 25),
                  CustomDropDown(text: "Seleccionar",
                    onchange: (e)=>controller.methodPaySelected.value=e!,
                    selectedId: controller.methodPaySelected.value,
                    listDynamic: controller.methods.map((e) => DropdownMenuItem(value: e.id,child: Text(e.name))).toList(),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Total a Pagar \$"+controller.paymentModel.value.total.toString()+" MX", style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1),
                   CustomButton(text: "Pagar todo",onPressed: controller.methodPaySelected.value==0?null:()=>controller.onPay(),)
                ],
              ).paddingOnly(top: 10)
            ],
          );
        }),
      ),
    );
  }

  Widget _itemPayment(BuildContext context,String name, List<_Payment> payment) {
    var total=0.0;
    payment.forEach((e) {
      total= total+e.price;
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Divider(height: 2,
            endIndent: 5,
            indent: 5,
            thickness: 1,
            color: Colors.black54),
        Card(
          color: Colors.white70,
          child: ListTile(
            title: Text(name, style: Theme
                .of(context)
                .textTheme
                .subtitle1),
            subtitle: Text("Total: \$$total", style: Theme
                .of(context)
                .textTheme
                .subtitle1),

          ),
        ),
      ],
    );
  }
}


class _Payment {
  String name;
  double price;
  int quantity;

  _Payment(this.name,this.price, this.quantity);
}

