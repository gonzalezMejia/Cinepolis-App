import 'package:flutter/material.dart';

class CustomCardImages extends StatelessWidget {
  const CustomCardImages(
      {Key? key, required this.item, required this.onPressed})
      : super(key: key);

  final GestureTapCallback onPressed;
  final String item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
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
                          width: 145,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      )))
            ],
          )),
    );
  }
}
