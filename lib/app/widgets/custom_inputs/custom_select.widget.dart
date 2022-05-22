import 'package:flutter/material.dart';

class CustomSelect extends StatelessWidget {
  const CustomSelect(
      {Key? key,
      required this.data,
      required this.onChanged,
      required this.selectedItem,
      required this.propNameId,
      required this.propNameDescription})
      : super(key: key);

  final Function(int?) onChanged;
  final List<dynamic> data;
  final int selectedItem;
  final String propNameId;
  final String propNameDescription;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      isExpanded: true,
      value: selectedItem,
      items: data
          .map((e) => DropdownMenuItem(
              value: int.parse(e[propNameId]),
              child: Text(e[propNameDescription])))
          .toList(),
      onChanged: (value) => onChanged(value),
      decoration: const InputDecoration(
        labelText: "Sucursal",
        border: OutlineInputBorder(),
      ),
    );
  }
}
