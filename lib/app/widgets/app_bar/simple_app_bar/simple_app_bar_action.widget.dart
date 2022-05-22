import 'package:cinepolis/app/widgets/custom_button/custom_button.widget.dart';
import 'package:flutter/material.dart';

class SimpleAppBarAction extends StatelessWidget {
  final String description;
  final GestureTapCallback onPressed;

  const SimpleAppBarAction(
      {Key? key, required this.description, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        fit: FlexFit.loose,
        flex: 1,
        child: CustomButton(text: description, onPressed: onPressed));
  }
}
