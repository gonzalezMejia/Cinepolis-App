import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String labelText;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  const CustomContainer(
      {Key? key,
      required this.labelText,
      required this.children,
      this.crossAxisAlignment = CrossAxisAlignment.start})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Theme.of(context).indicatorColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).indicatorColor),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}
