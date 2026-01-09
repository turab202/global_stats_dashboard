import 'package:flutter/material.dart';

const primaryColor = Color(0xFF1E88E5);

final lightTheme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: primaryColor,
  brightness: Brightness.light,
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: primaryColor,
  brightness: Brightness.dark,
);
