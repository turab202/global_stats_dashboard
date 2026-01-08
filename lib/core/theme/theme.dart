import 'package:flutter/material.dart';

final Color primaryBlack = Color(0xff202c3b);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryBlack,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Circular',
  appBarTheme: AppBarTheme(
    backgroundColor: primaryBlack,
    foregroundColor: Colors.white,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryBlack,
  scaffoldBackgroundColor: Colors.blueGrey[900],
  fontFamily: 'Circular',
  appBarTheme: AppBarTheme(
    backgroundColor: primaryBlack,
    foregroundColor: Colors.white,
  ),
);
