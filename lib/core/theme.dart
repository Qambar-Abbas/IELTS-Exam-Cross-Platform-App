import 'package:flutter/cupertino.dart';

class AppTheme {
  // IELTS Exam themed colors - Red, Black, White
  static const Color primaryColor = Color(0xFFE4002B); // Crimson red
  static const Color secondaryColor = Color(0xFF8B0000); // Dark red
  static const Color accentColor = Color(0xFFFF6B6B); // Light red accent
  static const Color backgroundColor = Color(0xFFFAFAFA); // Off-white
  static const Color errorColor = CupertinoColors.systemRed;

  // Additional IELTS theme colors
  static const Color textPrimary = Color(0xFF1A1A1A); // Near black
  static const Color textSecondary = Color(0xFF4A4A4A); // Dark gray
  static const Color cardBackground = Color(0xFFFFFFFF); // Pure white
  static const Color borderColor = Color(0xFFE0E0E0); // Light gray

  static final cupertinoTheme = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    barBackgroundColor: cardBackground,
    scaffoldBackgroundColor: backgroundColor,
    textTheme: CupertinoTextThemeData(
      primaryColor: textPrimary,
      navTitleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        fontFamily: 'SF Pro Display',
      ),
      textStyle: TextStyle(
        fontSize: 16,
        color: textPrimary,
        fontFamily: 'SF Pro Text',
      ),
      tabLabelTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textSecondary,
      ),
    ),
  );

  static final darkTheme = CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: accentColor,
    barBackgroundColor: Color(0xFF1C1C1E), // Dark gray
    scaffoldBackgroundColor: CupertinoColors.black,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.white,
      navTitleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: CupertinoColors.white,
        fontFamily: 'SF Pro Display',
      ),
      textStyle: TextStyle(
        fontSize: 16,
        color: CupertinoColors.white,
        fontFamily: 'SF Pro Text',
      ),
      tabLabelTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xFFAAAAAA),
      ),
    ),
  );
}
