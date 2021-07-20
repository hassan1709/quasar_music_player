import 'package:flutter/material.dart';

class Message {
  static void showErrorSnackBar(BuildContext context, String? message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message != null ? message : 'An error has occurred.'),
        backgroundColor: Theme.of(context).errorColor,
      ),
    );
  }

  static void showSuccessSnackBar(BuildContext context, String? message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message != null ? message : 'Success!!!'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
