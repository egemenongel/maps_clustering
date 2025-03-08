import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      centerTitle: false,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xff389E27),
      unselectedItemColor: Color(0xff6b6b6b),
    ),
  );
}
