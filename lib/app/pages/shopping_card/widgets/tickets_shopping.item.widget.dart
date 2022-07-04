import 'package:cinepolis/app/widgets/card/custom_card_expandible.widget.dart';
import 'package:cinepolis/data/models/entities/tickets/shopping_ticket.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketsShoppingItem extends StatelessWidget {
  final ShoppingTicketModel model;
  final GestureTapCallback onPress;

  const TicketsShoppingItem(this.model, this.onPress, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 3),
      child: Card(
        color: Colors.blueGrey[600],
        elevation: 2.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          onTap: onPress,
          subtitle: Row(children: [
            _imageContain(context, model.horarios!.pelicula!.photo!),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title(context, model.horarios!.pelicula!.nombre!),
                  _subtitle(context, "Inicio: ${model.horarios!.inicia!}").paddingOnly(top: 8,left:  15),
                  _subtitle(context, "Sala: ${model.horarios!.sala!.sala!}").paddingOnly(top: 3,left:  15),
                  CustomCardExpandable(labelText: "Asientos",icon: Icons.event_seat,widgetsExpand: [
                    ListView(
                      shrinkWrap: true,
                      children: model.asientos!.map((e) => ListTile(
                        title: Text("Lugar: "+e.nombreAsiento!),
                      trailing: Text("Costo: "+e.costo.toString()),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text("Folio: "+e.id.toString()),
                        Text(e.isAdult!?"Adulto":"Niño"),
                      ]),
                      )).toList()
                    )
                  ],)
                  // _subtitle(context, "Asientos: "+model.asiento!).paddingOnly(bottom: 8)
                ]
              ).paddingOnly(left: 20),
            ),
          ]),
        ).paddingOnly(top: 8, bottom: 8),
      ),
    );
  }

  Widget _title(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).primaryTextTheme.subtitle1,
      overflow: TextOverflow.visible,
      maxLines: 3,
      softWrap: true,
      textWidthBasis: TextWidthBasis.parent,
    );
  }

  Widget _subtitle(BuildContext context, String text,
      {Color color = Colors.white, double size = 0}) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .apply(color: color, fontSizeDelta: size),
      overflow: TextOverflow.fade,
      maxLines: 1,
      softWrap: false,
      textWidthBasis: TextWidthBasis.parent,
    );
  }

  Widget _imageContain(BuildContext context, String url) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Image.network(url, width: 80, height: 80, fit: BoxFit.cover));
  }
}