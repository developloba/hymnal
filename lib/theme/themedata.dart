import 'package:flutter/material.dart';
import 'package:hymnal/ui/utils/constant.dart';

enum Apptheme { lightTheme, darkTheme }

final appthemedata = {
  Apptheme.lightTheme: ThemeData(
    primaryColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
    backgroundColor: Colors.white,
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: kprimarycolorlight,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide),
    primarySwatch: Colors.red,
    fontFamily: 'Dm',
    textTheme: const TextTheme(
      headlineLarge:
          TextStyle(fontFamily: 'dmbold', fontSize: 45, color: Colors.black),
      labelMedium: TextStyle(fontSize: 15, color: Colors.black),
      bodySmall: TextStyle(fontSize: 25, color: Colors.grey),
      bodyMedium: TextStyle(fontSize: 25, color: Colors.black),
      labelSmall: TextStyle(fontSize: 15, color: Colors.grey),
    ),
  ),
  Apptheme.darkTheme: ThemeData(
      primaryColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.black,
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.black,
          indicatorColor: kprimarycolor,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide),
      primarySwatch: Colors.red,
      fontFamily: 'Dm',
      textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontFamily: 'dmbold', fontSize: 45, color: Colors.white),
          labelMedium: TextStyle(fontSize: 15, color: Colors.black),
          bodySmall: TextStyle(fontSize: 25, color: Colors.grey),
          labelSmall: TextStyle(fontSize: 15, color: Colors.grey),
          bodyMedium: TextStyle(fontSize: 25, color: Colors.white)))
};
