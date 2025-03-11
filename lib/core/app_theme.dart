import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiliz/core/constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final AppTheme _instance = AppTheme._();
  static AppTheme get instance => _instance;
  static final _textTheme = GoogleFonts.urbanistTextTheme();
  final theme = ThemeData(
    textTheme: _textTheme,
    fontFamily: GoogleFonts.urbanist().fontFamily,
    appBarTheme: AppBarTheme(
      foregroundColor: AppColors.textColor500,
      centerTitle: false,
      titleTextStyle: _textTheme.headlineMedium?.copyWith(
        color: AppColors.textColor500,
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
      backgroundColor: AppColors.white50,
      selectedItemColor: AppColors.main500,
      selectedIconTheme: IconThemeData(
        color: Color(0xffC3E6BD),
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.textColor300,
      ),
      unselectedItemColor: AppColors.textColor300,
    ),
  );
}
