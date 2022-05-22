import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {Key? key,
      required this.text,
      required this.onchange,
      required this.selectedId,
      required this.listDynamic})
      : super(key: key);

  final Function(int?) onchange;
  final String text;
  final int selectedId;
  final List<DropdownMenuItem<int>>? listDynamic;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      isExpanded: true,
      value: selectedId,
      items: listDynamic,
      onChanged: (value) => onchange(value),
      decoration: InputDecoration(
        labelText: text,
        border: const OutlineInputBorder(),
      ),
    ).paddingOnly(left: 20, top: 20, right: 20);
  }
}
