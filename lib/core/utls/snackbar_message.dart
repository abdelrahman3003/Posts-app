import 'package:flutter/material.dart';

class SnackbarMessage {
  showSnackBarSuccess(String message, BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.lightGreen,
      ),
    );
  }

  showSnackBarError(String message, BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
