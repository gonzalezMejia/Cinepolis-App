import 'package:flutter/material.dart';

final ThemeData darkAppTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.black54,
  primaryColorLight: Colors.black12,
  primaryColorDark: Colors.black38,
  highlightColor: Colors.white70,
  indicatorColor: Colors.black,
  hoverColor: Colors.white,
  scaffoldBackgroundColor: Colors.black,
  colorScheme:
      const ColorScheme.dark(secondary: Colors.black12 //this is physics color
          ),
  iconTheme: const IconThemeData(
    color: Colors.white70,
    size: 37,
  ),

  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(
          sizeConstraints:BoxConstraints(maxHeight: 120,maxWidth: 120,minHeight: 50,minWidth: 50),
          backgroundColor: Colors.white38),

  inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.white12,
      hoverColor: Colors.yellowAccent,
      focusColor: Colors.green,
      alignLabelWithHint: true),

  // Define the default font family.
  fontFamily: 'Hind',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 30.0, color: Colors.white),
    overline: TextStyle(fontSize: 25.0, color: Colors.blue),
    caption: TextStyle(fontSize: 24.0, color: Colors.white),
    headline2: TextStyle(fontSize: 20.0, color: Colors.white),
    headline3: TextStyle(fontSize: 25.0, color: Colors.white),
    subtitle1: TextStyle(fontSize: 16.0, color: Colors.white),
    bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
    headline6: TextStyle(fontSize: 13.0, color: Colors.white), //item title
    subtitle2: TextStyle(fontSize: 18.0, color: Colors.white70),
    headline4: TextStyle(fontSize: 15.0, color: Colors.white),
    headline5: TextStyle(fontSize: 11.0, color: Colors.white),
    button: TextStyle(fontSize: 12.0, color: Colors.white70),
    bodyText2: TextStyle(fontSize: 10.0, fontFamily: 'Hind', color: Colors.white), //item subtitle
  ),
  primaryTextTheme: const TextTheme(
    bodyText2: TextStyle(fontSize: 30.0, color: Colors.white),
    headline3: TextStyle(fontSize: 20.0, color: Colors.blue),
    headline2: TextStyle(fontSize: 25.0, color: Colors.white),
    subtitle1: TextStyle(fontSize: 16.0, color: Colors.white),
    headline4: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
    headline5: TextStyle(fontSize: 15.0, color: Colors.white),
    headline6: TextStyle(fontSize: 14.0, color: Colors.white),
  ),
);
