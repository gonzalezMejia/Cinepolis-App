import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String labelText;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  const CustomContainer(
      {required this.labelText,
      required this.children,
      this.crossAxisAlignment = CrossAxisAlignment.start});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Theme.of(context).hoverColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).hoverColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      ),
    );
  }
}
