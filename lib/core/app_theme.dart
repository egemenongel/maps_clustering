import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    appBarTheme: AppBarTheme(
      foregroundColor: Color(0xff222222),
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Color(0xff222222),
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.1,
      ),
      actionsIconTheme: IconThemeData(
        color: Color(0xff4E4E4E),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1,
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xff3DAE2B),
      selectedIconTheme: IconThemeData(
        color: Color(0xffC3E6BD),
      ),
      unselectedLabelStyle: TextStyle(
        color: Color(0xff6b6b6b),
      ),
      unselectedItemColor: Color(0xff6b6b6b),
    ),
  );
}
