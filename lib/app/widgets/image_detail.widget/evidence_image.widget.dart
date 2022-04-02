import 'package:flutter/material.dart';

class EvidenceImage extends StatelessWidget {
  EvidenceImage({required this.item, required this.onPressed});

  final GestureTapCallback onPressed;
  final String item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: new Card(
          elevation: 2,
          child: Column(
            children: <Widget>[
              Flexible(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: "image$item",
                        child: FadeInImage.assetNetwork(
                          placeholder: "assets/images/loading.gif",
                          image: item,
                          fit: BoxFit.cover,
                        ),
                      )))
            ],
          )),
    );
  }
}
