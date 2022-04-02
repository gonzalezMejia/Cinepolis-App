import 'package:Cinepolis/app/pages/audit/rotisserie_inventory/inventory_new/rotisserie_inventory_new.controller.dart';
import 'package:Cinepolis/app/widgets/custom_container/custom_container.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RotisserieDetailDialog extends GetView<RotisserieInventoryNewController> {
  final int position;

  RotisserieDetailDialog(this.position);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).indicatorColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            ),
          ),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _headerWidget(context),
                _content(context).paddingOnly(top: 10)
              ],
            );
          }).paddingAll(10)),
    );
  }

  Widget _content(BuildContext context) {
    var product =
        controller.rotisserie.value.rostisserieBalanceProducts![position];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _titleWidget(context, "Total Sistema", product.stock!, false,
            (val) => product.stock = val),
        _titleWidget(context, "Existencia Física", product.physicalExistence!,
            true, (val) => product.physicalExistence = val),
        _titleWidget(context, "Cambios y Pendientes", product.changesPending!,
            true, (val) => product.changesPending = val),
        _titleTextController(
            context, "Diferencia en Piezas", product.differenceParts!),
        //Si el producto tiene diferencia (piezas), el número de diferencia en piezas se deberá multiplicar
        // por el precio unitario del producto para llenar este campo
        _titleTextController(
            context, "Diferencia en Pesos", product.differencePesos!),
        _textFieldDescription(context).paddingAll(15)
      ],
    );
  }

  Widget _headerWidget(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              controller.rotisserie.value.rostisserieBalanceProducts![position]
                  .productName!,
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.start,
            ).paddingOnly(top: 5),
          ),
          Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    size: 30,
                  )))
        ]);
  }

  Widget _titleWidget(BuildContext context, String title, double count,
      bool isEditing, Function(double val) onSave) {
    final controllerText =
        TextEditingController(text: count.toInt().toString());
    return Row(children: [
      Expanded(
        flex: 1,
        child: Text(title,
            style: Theme.of(context).textTheme.bodyText1,
            softWrap: false,
            maxLines: 10,
            overflow: TextOverflow.ellipsis),
      ),
      SizedBox(
          width: 200,
          child: Row(children: [
            IconButton(
                icon: Icon(Icons.remove, size: 20),
                onPressed: !isEditing
                    ? null
                    : () {
                        count = count - 1;
                        controllerText.text = count.toInt().toString();
                        onSave(count);
                        controller.changeBoxText();
                      }),
            SizedBox(
                width: 100,
                height: 40,
                child: TextField(
                  enabled: isEditing,
                  textAlign: TextAlign.center,
                  obscureText: false,
                  controller: controllerText,
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: false, signed: true),
                  keyboardAppearance: Brightness.dark,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                  ),
                  onChanged: (value) {
                    var val = double.tryParse(value) ?? 0;
                    if (val > 0) {
                      count = val;
                      onSave(count);
                      controller.changeBoxText();
                    }
                  },
                )),
            IconButton(
                icon: Icon(Icons.add, size: 20),
                onPressed: !isEditing
                    ? null
                    : () {
                        count = count + 1;
                        controllerText.text = count.toInt().toString();
                        onSave(count);
                        controller.changeBoxText();
                      }),
          ])),
    ]);
  }

  Widget _titleTextController(BuildContext context, String title,
      TextEditingController controllerText) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: Text(title,
            style: Theme.of(context).textTheme.bodyText1,
            softWrap: false,
            maxLines: 10,
            overflow: TextOverflow.ellipsis),
      ),
      SizedBox(
          width: 200,
          child: Row(children: [
            IconButton(icon: Icon(Icons.remove, size: 20), onPressed: null),
            SizedBox(
                width: 100,
                height: 40,
                child: TextField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  obscureText: false,
                  controller: controllerText,
                  keyboardType: TextInputType.number,
                  keyboardAppearance: Brightness.dark,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                  ),
                )),
            IconButton(icon: Icon(Icons.add, size: 20), onPressed: null),
          ])),
    ]);
  }

  Widget _textFieldDescription(BuildContext context) {
    return CustomContainer(labelText: "Observaciones", children: [
      TextField(
          autofocus: false,
          focusNode: FocusNode(
              canRequestFocus: false,
              descendantsAreFocusable: false,
              skipTraversal: false),
          autocorrect: true,
          cursorColor: Theme.of(context).hoverColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 8, right: 8),
          ),
          maxLines: 3,
          obscureText: false,
          onChanged: (value) => controller.rotisserie.value
              .rostisserieBalanceProducts![position].observations = value)
    ]);
  }
}
