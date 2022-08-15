import 'package:flutter/material.dart';
import 'package:app_project/components/app_colors.dart';

class AppThemes {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: AppColors.primaryMeterialColor,
        fontFamily: 'GmarketSans',
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.white,
        textTheme: _textTheme,
        appBarTheme: _appBarTheme,
        brightness: Brightness.light,
      );

  static ThemeData get darkTheme => ThemeData(
        primarySwatch: AppColors.primaryMeterialColor,
        fontFamily: 'GmarketSans',
        // scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.white,
        textTheme: _textTheme,
        brightness: Brightness.dark,
      );

  static const AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: AppColors.primaryColor,
    ),
    elevation: 0,
  );

  static const TextTheme _textTheme = TextTheme(
    headline4: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryColor,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryColor,
    ),
    subtitle2: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryColor,
    ),
    bodyText1: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: AppColors.primaryColor,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColors.primaryColor,
    ),
    button: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: AppColors.primaryColor,
    ),
  );
}
