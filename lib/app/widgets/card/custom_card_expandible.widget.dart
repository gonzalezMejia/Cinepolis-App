import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CustomCardExpandable extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final List<Widget> widgetsExpand;
  final Widget? widgetCollapsed;
  CustomCardExpandable(
      {required this.icon,
      this.labelText = "",
      required this.widgetsExpand,
      this.widgetCollapsed});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Card(
            color:  Colors.blueGrey[600],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              margin: const EdgeInsets.all(15),
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                    alignment: Alignment.center, iconColor: Colors.white60),
                header: Row(children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        icon,
                        color: Colors.white60,
                      )),
                  Flexible(
                    child: Text(
                      labelText,
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .subtitle1!
                          .apply(color: Colors.white60),
                    ),
                  )
                ]),
                collapsed:
                    widgetCollapsed == null ? const Text("") : widgetCollapsed!,
                expanded: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: widgetsExpand),
              ),
            )));
  }
}
