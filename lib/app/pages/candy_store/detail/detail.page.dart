import 'package:cinepolis/data/models/entities/movies/movies.model.dart';
import 'package:cinepolis/data/models/entities/promotions/products.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsItem extends StatelessWidget {
  final ProductsModel model;

  const ProductsItem(this.model, {Key? key}) : super(key: key);

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
          subtitle: Row(children: [
            _imageContain(context, model.photo!),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title(context, model.producto!),
                  _subtitle(context, model.descripcion!).paddingOnly(top: 8),
                  _subtitle(context, "Precio: \$ ${model.precioV!}")
                      .paddingOnly(top: 3),
                ],
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
      maxLines: 5,
      softWrap: true,
      textWidthBasis: TextWidthBasis.parent,
    );
  }

  Widget _imageContain(BuildContext context, String url) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Image.network(url, width: 80, height: 80, fit: BoxFit.cover));
  }
}
