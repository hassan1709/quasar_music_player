import 'package:flutter/material.dart';

final _primarySwatchColor = Colors.deepOrange;
final _primaryColor = Colors.deepOrange.shade800;
final _accentColor = Colors.deepOrangeAccent.shade400;
final _errorColor = Colors.redAccent.shade700;
final _hintColor = Colors.white;
final _buttonColor = Colors.deepOrange;
final _highlightColor = Colors.deepOrange.shade300;
final _elevatedButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);

final _textButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
);

final _textFieldTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
);
final _labelTextStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.deepOrange.shade800,
);

final theme = ThemeData(
  primarySwatch: _primarySwatchColor,
  primaryColor: _primaryColor,
  errorColor: _errorColor,
  accentColor: _accentColor,
  highlightColor: _highlightColor,
  hintColor: _hintColor,
  buttonColor: _buttonColor,

  iconTheme: const IconThemeData(
    color: Colors.white,
    size: 30.0,
  ),
  textTheme: TextTheme(
    //text style for buttons
    bodyText2: _elevatedButtonTextStyle,
    //text style for textFields
    subtitle1: _textFieldTextStyle,
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
      borderSide: BorderSide(
        style: BorderStyle.none,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        style: BorderStyle.none,
      ),
    ),
    labelStyle: TextStyle(
      fontSize: 15.0,
      color: _primaryColor,
    ),
    hintStyle: TextStyle(
        //color: _accentColor,
        ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10.0,
      textStyle: _elevatedButtonTextStyle,
      padding: EdgeInsets.all(10.0),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.white,
      padding: EdgeInsets.all(15.0),
      textStyle: _textButtonTextStyle,
      //elevation: 1.0,
      backgroundColor: Color.fromRGBO(255, 87, 34, 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  ),
);
