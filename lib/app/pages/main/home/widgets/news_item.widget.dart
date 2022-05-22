import 'package:cinepolis/data/models/entities/movies/movies.model.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final MoviesModel model;

  const NewsItem(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* GestureDetector(
              onTap: () => MsgOptions.customImage(context, model.traierUrl!,
                  tag: model.idAviso.toString()),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image: '${model.urlArchivo}',
                  )),
            ),*/
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 10),
              child: _title(context, '${model.nombre}'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context, String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
      overflow: TextOverflow.fade,
      maxLines: 1,
      softWrap: false,
      textWidthBasis: TextWidthBasis.parent,
    );
  }
}
