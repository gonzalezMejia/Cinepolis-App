import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
        this.onPressed,
      this.color = Colors.blue})
      : super(key: key);

  final GestureTapCallback? onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                defineColor(context)),
            foregroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).inputDecorationTheme.fillColor!)),
        onPressed: onPressed,
        child: Container(
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            padding: const EdgeInsets.all(10)),
      ),
    );
  }

  Color defineColor(BuildContext context) {
    if (onPressed==null) {
      return Colors.grey[600]!;
    } else if(color == Colors.blue){
      return Theme.of(context).primaryColor;
    } else {
      return color;
    }
  }
}
