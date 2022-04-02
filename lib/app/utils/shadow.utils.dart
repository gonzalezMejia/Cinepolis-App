import 'package:flutter/material.dart';

class ShadowUtils {
  static BoxDecoration hexImageSmall() {
    return BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          const BoxShadow(color: Colors.white),
          const BoxShadow(
            color: Colors.lightBlueAccent,
            spreadRadius: -12.0,
            blurRadius: 12.0,
          ),
        ],
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: new AssetImage('assets/images/logo_esp_small.jpeg'),
        ));
  }
}
