import 'package:coffee_app/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColor.primary),
    titleTextStyle: const TextStyle(
        color: AppColor.primary,
        fontWeight: FontWeight.bold,
        fontFamily: "PlayfairDisplay",
        fontSize: 25),
    backgroundColor: Colors.grey[50],
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primary,
  ),
  fontFamily: "JosefinSans",
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.textcolor),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.textcolor),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.dgray,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.dgray, fontSize: 14)),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColor.primary),
    titleTextStyle: const TextStyle(
        color: AppColor.primary,
        fontWeight: FontWeight.bold,
        fontFamily: "Cairo",
        fontSize: 25),
    backgroundColor: Colors.grey[50],
  ),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: AppColor.primary),
  fontFamily: "Cairo",
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.textcolor),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.textcolor),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.dgray,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.dgray, fontSize: 14)),
  primarySwatch: Colors.blue,
);
