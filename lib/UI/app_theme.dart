import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get data {
    return ThemeData(
      textTheme: const TextTheme(
        subtitle1: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
        ),
        subtitle2: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
