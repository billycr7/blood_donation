import 'package:flutter/material.dart';

void showSnackBar(context, message, color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(10)),
    behavior: SnackBarBehavior.floating,
  ));
}
