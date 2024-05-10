import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void alertSnackBar(
    context, String message, Color color, int duration, FaIcon icon) {
  final snackBar = SnackBar(
      backgroundColor: color,
      duration: Duration(seconds: duration),
      content: Row(
        children: [
          icon,
          const SizedBox(
            width: 8,
          ),
          Text(
            message,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
      action: SnackBarAction(label: '', onPressed: () {}));

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
