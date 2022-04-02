import 'package:Cinepolis/data/models/entities/dynamic/dynamic_summary.model.dart';
import 'package:flutter/material.dart';

class HomeImage extends StatelessWidget {
  final Field item;

  HomeImage(this.item);

  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.fill,
      image: NetworkImage(item.value!),
      width: (item.fieldOptions != null && item.fieldOptions!.width != null)
          ? double.parse(item.fieldOptions!.width!.toString())
          : 150,
      height: (item.fieldOptions != null && item.fieldOptions!.heigth != null)
          ? double.parse(item.fieldOptions!.heigth!.toString())
          : 150,
    );
  }
}
