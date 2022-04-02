import 'package:Cinepolis/app/utils/msg_options.utils.dart';
import 'package:Cinepolis/data/models/entities/news/news.model.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final NewsModel model;
  NewsItem(this.model);

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
            GestureDetector(
              onTap: () => MsgOptions.customImage(context, model.urlArchivo!,
                  tag: model.idAviso.toString()),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image: '${model.urlArchivo}',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 10),
              child: _title(context, '${model.nombre}'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, bottom: 10),
              child: _description(context, '${model.descripcion}'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
      overflow: TextOverflow.fade,
      maxLines: 1,
      softWrap: false,
      textWidthBasis: TextWidthBasis.parent,
    );
  }

  Widget _description(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 15),
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      softWrap: false,
      textWidthBasis: TextWidthBasis.parent,
    );
  }
}
