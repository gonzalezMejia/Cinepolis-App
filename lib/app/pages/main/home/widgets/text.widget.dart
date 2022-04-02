import 'package:Cinepolis/app/utils/colors.utils.dart';
import 'package:Cinepolis/data/models/entities/dynamic/dynamic_summary.model.dart';
import 'package:flutter/material.dart';

class HomeText extends StatelessWidget {
  final Field item;

  HomeText(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(item.value!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: (item.fieldOptions != null &&
                        item.fieldOptions!.fontSize != null)
                    ? double.parse(item.fieldOptions!.fontSize.toString())
                    : 15,
                color: (item.fieldOptions != null &&
                        item.fieldOptions!.color != null &&
                        item.fieldOptions!.color != '')
                    ? ColorsUtils.hexToColor(item.fieldOptions!.color!)
                    : Colors.black)),
        width: (item.fieldOptions != null &&
                item.fieldOptions!.width != null &&
                item.fieldOptions!.width! > 0)
            ? double.parse(item.fieldOptions!.width!.toString())
            : double.infinity,
        alignment:
            (item.fieldOptions != null && item.fieldOptions!.align != null)
                ? (item.fieldOptions!.align! == 'left')
                    ? Alignment.centerLeft
                    : (item.fieldOptions!.align! == 'center')
                        ? Alignment.center
                        : Alignment.centerRight
                : Alignment.centerLeft);
  }
}
