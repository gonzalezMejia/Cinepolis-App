import 'package:cinepolis/app/widgets/sheets/sheet_container.widget.dart';
import 'package:flutter/material.dart';

class SheetUtils {
  static show(BuildContext context, Widget content,
      {String? title, Function? onCancel}) {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return SheetContainer(content, title, onCancel);
        });
  }
}
