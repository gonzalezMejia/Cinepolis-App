import 'package:flutter/material.dart';

final ThemeData darkAppTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: const Color.fromRGBO(32, 54, 107, 1),
  primaryColorLight: const Color.fromRGBO(79, 96, 137, 1),
  primaryColorDark: Colors.blueGrey,
  highlightColor: const Color.fromRGBO(254, 254, 255, 1),
  indicatorColor: Colors.blue[900],
  hoverColor: const Color.fromRGBO(254, 254, 255, 1),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.dark(
      secondary: Colors.blueAccent //this is physics color
      ),
  iconTheme: const IconThemeData(
    color: Color.fromRGBO(254, 254, 255, 1),
    size: 37,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.blue[900],
    selectionHandleColor: Colors.blue[900],
    selectionColor: Colors.blue[200],
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      sizeConstraints: BoxConstraints(
          maxHeight: 120, maxWidth: 120, minHeight: 50, minWidth: 50),
      backgroundColor: Colors.white38),

  inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.white12,
      hoverColor: Colors.yellowAccent,
      focusColor: Colors.green,
      alignLabelWithHint: true),

  // Define the default font family.
  fontFamily: 'Bierstadt',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headline1: const TextStyle(fontSize: 30.0, color: Colors.white),
    overline: const TextStyle(fontSize: 25.0, color: Colors.blue),
    caption: const TextStyle(fontSize: 24.0, color: Colors.white),
    headline2: const TextStyle(fontSize: 20.0, color: Colors.white),
    headline3: const TextStyle(fontSize: 25.0, color: Colors.white),
    subtitle1: TextStyle(fontSize: 16.0, color: Colors.blue[900]),
    bodyText1: const TextStyle(fontSize: 14.0, color: Colors.black54),
    headline6:
        const TextStyle(fontSize: 13.0, color: Colors.white), //item title
    subtitle2: const TextStyle(fontSize: 18.0, color: Colors.white70),
    headline4: const TextStyle(fontSize: 15.0, color: Colors.white),
    headline5: const TextStyle(fontSize: 11.0, color: Colors.white),
    button: const TextStyle(fontSize: 12.0, color: Colors.white70),
    bodyText2:
        const TextStyle(fontSize: 10.0, color: Colors.white), //item subtitle
  ),
  primaryTextTheme: const TextTheme(
    bodyText2: TextStyle(fontSize: 30.0, color: Colors.white),
    headline3: TextStyle(fontSize: 20.0, color: Colors.blue),
    headline2: TextStyle(fontSize: 25.0, color: Colors.white),
    subtitle1: TextStyle(
        fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
    headline4: TextStyle(
        fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
    headline5: TextStyle(fontSize: 15.0, color: Colors.white),
    headline6: TextStyle(fontSize: 14.0, color: Colors.white),
  ),
);
