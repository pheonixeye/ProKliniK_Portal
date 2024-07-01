import 'package:flutter/material.dart';

SnackBar snackBar(String message, Color color) {
  return SnackBar(
    backgroundColor: color,
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
