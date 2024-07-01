import 'package:flutter/material.dart';

SnackBar snackBar(String message, Color color) {
  return SnackBar(
    backgroundColor: color,
    content: Row(
      children: [
        Text(message),
      ],
    ),
  );
}
