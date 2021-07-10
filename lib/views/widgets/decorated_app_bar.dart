import 'package:flutter/material.dart';

class DecoratedAppBar {
  static AppBar appBar(BuildContext context, String title) {
    return AppBar(
      title: Text(title),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).buttonColor,
              Theme.of(context).highlightColor,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              offset: Offset(0.0, 5.0),
              blurRadius: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
