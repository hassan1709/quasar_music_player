import 'package:flutter/material.dart';

final appBar = AppBar(
  flexibleSpace: Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/quasar.jpg'),
        fit: BoxFit.cover,
      ),
    ),
  ),
  backgroundColor: Colors.transparent,
  title: Text(
    'Quasar Music Player',
  ),
  elevation: 1.0,
);
