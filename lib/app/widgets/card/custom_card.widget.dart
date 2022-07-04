import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final List<Widget> widgets;

  CustomCard({this.labelText = "", required this.icon, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        color: Theme.of(context).disabledColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            margin: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      icon,
                      color: Theme.of(context).primaryColorLight,
                    )),
                Flexible(
                  child: Text(
                    labelText,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .subtitle1!
                        .apply(color: Theme.of(context).primaryColorLight),
                  ),
                )
              ]),
              ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: widgets),
            ])),
      ),
    );
  }
}
