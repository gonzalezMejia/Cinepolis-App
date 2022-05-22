import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.btnController,
      this.color = Colors.blue})
      : super(key: key);

  final RoundedLoadingButtonController btnController;
  final GestureTapCallback onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      height: MediaQuery.of(context).size.height * 0.079,
      controller: btnController,
      onPressed: onPressed,
      resetAfterDuration: true,
      resetDuration: const Duration(seconds: 3),
      child: Text(text, style: Theme.of(context).primaryTextTheme.headline6),
      color: defineColor(context),
      successColor: defineColor(context),
      errorColor: Colors.red,
    );
  }

  Color defineColor(BuildContext context) {
    if (color == Colors.blue) {
      return Theme.of(context).colorScheme.secondary;
    } else {
      return color;
    }
  }
}
