import 'package:flutter/material.dart';

class ProgressPrimary extends StatelessWidget {
  const ProgressPrimary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).hoverColor,
        strokeWidth: 3,
        valueColor:
            AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
      ),
    );
  }
}
