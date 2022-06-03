import 'package:flutter/material.dart';

class CustomButtonLarge extends StatelessWidget {
  const CustomButtonLarge(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color = Colors.blue})
      : super(key: key);

  final GestureTapCallback onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15,left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.8),
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
              padding: const EdgeInsets.all(20)),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor,),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0))))),
    );
  }
}
