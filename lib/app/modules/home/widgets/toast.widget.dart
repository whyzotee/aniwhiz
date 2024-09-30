import 'package:flutter/material.dart';

class ToastBar {
  ToastBar._();

  static const snackBar = SnackBar(
    content: Text('This zone not avaliable'),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.redAccent,
  );

  static void show(context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
