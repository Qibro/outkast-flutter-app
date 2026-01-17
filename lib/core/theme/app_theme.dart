import 'package:flutter/material.dart';
import 'package:outkast/core/theme/app_pallette.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppPallette.backgroundColor,
      selectedItemColor: AppPallette.gradient1,
      unselectedItemColor: AppPallette.greyColor,
    ),
    scaffoldBackgroundColor: AppPallette.backgroundColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppPallette.backgroundColor,
      iconTheme: IconThemeData(color: AppPallette.whiteColor),
      titleTextStyle: AppStyle.titleMainBoldItalic(),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppPallette.whiteColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: AppPallette.hintTextColor),
    ),
    dividerColor: AppPallette.dividerColor,
  );
}

class AppStyle {
  static TextStyle titleMainBold([double fontSize = 22.0, Color? color]) =>
      TextStyle(
        color: color ?? AppPallette.whiteColor,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      );
  static TextStyle titleMainBoldItalic([
    double fontSize = 22.0,
    Color? color,
  ]) => TextStyle(
    color: color ?? AppPallette.whiteColor,
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );
  static TextStyle textFieldTitle = TextStyle(
    color: AppPallette.titleFieldColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMedium([double fontSize = 16.0, Color? color]) =>
      TextStyle(
        color: color ?? AppPallette.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      );
  static TextStyle textSemiBold([double fontSize = 16.0, Color? color]) =>
      TextStyle(
        color: color ?? AppPallette.whiteColor,
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
      );
  static ButtonStyle elevatedButtonStyle([bool isMainTheme = true]) =>
      ElevatedButton.styleFrom(
        backgroundColor: isMainTheme
            ? AppPallette.gradient1
            : AppPallette.whiteColor,
        minimumSize: Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: isMainTheme ? AppPallette.whiteColor : AppPallette.blackColor,
        ),
      );
}
