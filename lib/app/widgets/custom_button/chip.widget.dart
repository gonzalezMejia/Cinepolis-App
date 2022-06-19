import 'package:flutter/material.dart';

class ChipItem extends StatelessWidget {
  final String title;
  final GestureTapCallback onPress;
  final GestureTapCallback? onDelete;

  ChipItem(this.title, this.onPress, {this.onDelete});
  @override
  Widget build(BuildContext context) {
    return onDelete != null
        ? InputChip(
            label: Text(title,
                softWrap: true,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(color: Colors.white)),
            checkmarkColor: Colors.white,
            deleteIconColor: Colors.red,
            onPressed: onPress,
            onDeleted: onDelete,
          )
        : Align(
            alignment: Alignment.bottomLeft,
            child: InputChip(
                label: Text(title, style: const TextStyle(color: Colors.white)),
                checkmarkColor: Colors.white,
                deleteIconColor: Colors.red,
                onPressed: onPress),
          );
  }
}
