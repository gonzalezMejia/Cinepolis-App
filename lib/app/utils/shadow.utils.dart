import 'package:flutter/material.dart';

class ShadowUtils {
  static BoxDecoration hexImageSmall() {
    return const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.white),
          BoxShadow(
            color: Colors.lightBlueAccent,
            spreadRadius: -12.0,
            blurRadius: 12.0,
          ),
        ],
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/logo_esp_small.jpeg'),
        ));
  }
}
