import 'package:flutter/material.dart';

class CustomButtonLarge extends StatelessWidget {
  CustomButtonLarge(
      {required this.text, required this.onPressed, this.color = Colors.blue});

  final GestureTapCallback onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(28.8)),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: ElevatedButton(
          onPressed: () => onPressed(),
          child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 15, color: Theme.of(context).hoverColor),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.all(20)),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(defineColor(context)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0))))),
    );
  }

  Color defineColor(BuildContext context) {
    if (color == Colors.blue) {
      return Theme.of(context).highlightColor;
    } else {
      return color;
    }
  }
}
