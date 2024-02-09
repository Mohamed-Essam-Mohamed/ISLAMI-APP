// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class MyTheme {
  static Color WhiteColor = Color(0xffFFFFFF);
  static Color blackColor = Color(0xff242424);
  static Color defulteColorLight = Color(0xffB7935F);
  static Color defulteColorDark = Color(0xff141A2E);
  static Color yellowColor = Color(0xffFACC1D);

  static ThemeData themeLight = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: defulteColorLight,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: blackColor,
      elevation: 0,
      selectedItemColor: blackColor,
      selectedIconTheme: IconThemeData(
        size: 43,
      ),
      unselectedIconTheme: IconThemeData(
        size: 40,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: blackColor,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: blackColor,
        fontSize: 23,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
  ///////////////////////////
  static ThemeData themeDark = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: defulteColorDark,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: WhiteColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: blackColor,
      elevation: 0,
      selectedItemColor: yellowColor,
      selectedIconTheme: IconThemeData(
        size: 38,
      ),
      unselectedIconTheme: IconThemeData(
        size: 35,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: WhiteColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: WhiteColor,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: WhiteColor,
        fontSize: 23,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
