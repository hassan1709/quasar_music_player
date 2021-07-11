import 'package:flutter/material.dart';

final _coolGreyColor = Color.fromRGBO(58, 66, 86, 1.0);
final _coolGreyColorLighter = Color.fromRGBO(64, 75, 96, .9);
final _primarySwatchColor = Colors.deepOrange;
final _primaryColor = _coolGreyColor; //Colors.deepOrange.shade800;
final _accentColor = _coolGreyColorLighter; //Colors.deepOrangeAccent.shade400;
final _errorColor = Colors.redAccent.shade700;
final _hintColor = Colors.white;
final _buttonColor = Colors.deepOrange;
final _highlightColor = Colors.deepOrange.shade300;

final _elevatedButtonTextStyle = const TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);

final _textButtonTextStyle = const TextStyle(
  color: Colors.white,
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
);

final _textFieldTextStyle = const TextStyle(
  color: Colors.white,
  fontSize: 16.0,
);

final theme = ThemeData(
  primarySwatch: _primarySwatchColor,
  primaryColor: _primaryColor,
  errorColor: _errorColor,
  accentColor: _accentColor,
  highlightColor: _highlightColor,
  hintColor: _hintColor,
  buttonColor: _buttonColor,

  ///TODO CardTheme
  //cardTheme: ,

  primaryIconTheme: IconThemeData(
    color: _coolGreyColor,
    size: 30.0,
  ),

  iconTheme: const IconThemeData(
    color: Colors.white,
    size: 30.0,
  ),
  textTheme: TextTheme(
    //text style for buttons
    bodyText2: _elevatedButtonTextStyle,
    //text style for textFields
    subtitle1: _textFieldTextStyle,

    headline1: const TextStyle(
      color: Colors.green,
      fontSize: 20.0,
    ),
    headline2: const TextStyle(
      color: Colors.deepOrange,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    ),
    headline3: const TextStyle(
      color: Colors.white60,
      fontSize: 13.0,
    ),
    headline4: const TextStyle(
      color: Colors.lightBlueAccent,
      fontSize: 12.0,
    ),
    caption: TextStyle(
      color: _coolGreyColor,
      fontSize: 18.0,
    ),
  ),
  // Styling textFields and textFormFields (except the content text)
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    //fillColor: Color.fromRGBO(255, 171, 145, 0.25),
    border: InputBorder.none,
    contentPadding: EdgeInsets.symmetric(
      vertical: 20.0,
      horizontal: 10.0,
    ),
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(
        style: BorderStyle.none,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(
        style: BorderStyle.none,
      ),
    ),
    labelStyle: TextStyle(
      fontSize: 15.0,
      color: _primaryColor,
    ),
    hintStyle: TextStyle(
      color: _hintColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10.0,
      textStyle: _elevatedButtonTextStyle,
      padding: const EdgeInsets.all(10.0),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.white,
      padding: const EdgeInsets.all(15.0),
      textStyle: _textButtonTextStyle,
      //elevation: 1.0,
      backgroundColor: const Color.fromRGBO(255, 87, 34, 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  ),
);
