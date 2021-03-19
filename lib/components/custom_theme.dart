import 'package:flutter/material.dart';

final customThemeSingleUser = ThemeData(
  fontFamily: "Ubuntu",
  primarySwatch: Colors.lightBlue,
  primaryColor: Colors.lightBlue.shade600,
  accentColor: Colors.orangeAccent.shade400,
  primaryColorBrightness: Brightness.dark,
  snackBarTheme:
      SnackBarThemeData(backgroundColor: Colors.red), // le theme du snackBar
);

final customThemeBusinessUser = ThemeData(
    fontFamily: "Ubuntu",
    primarySwatch: Colors.lightGreen,
    primaryColor: Colors.lightGreen.shade600,
    accentColor: Colors.orangeAccent.shade400,
    primaryColorBrightness: Brightness.dark,
    snackBarTheme:
        SnackBarThemeData(backgroundColor: Colors.red) // le theme du snackBar
    );
