import 'package:flutter/material.dart';
import 'package:hymnal/ui/utils/constant.dart';

enum Apptheme { lightTheme, darkTheme }

final appthemedata = {
  Apptheme.lightTheme: ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: kprimarycolorlight,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide),
    fontFamily: 'Dm',
    textTheme: const TextTheme(
      headlineLarge:
          TextStyle(fontFamily: 'dmbold', fontSize: 45, color: Colors.black),
      labelMedium: TextStyle(fontSize: 15, color: Colors.black),
      headlineSmall:
          TextStyle(fontFamily: 'dmbold', fontSize: 30, color: Colors.black),
      bodySmall: TextStyle(fontSize: 10, color: Colors.grey),
      bodyLarge: TextStyle(fontSize: 30, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 25, color: Colors.black),
      labelSmall: TextStyle(fontSize: 15, color: Colors.grey),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)
        .copyWith(background: Colors.white),
  ),
  Apptheme.darkTheme: ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.black),
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.black,
          indicatorColor: kprimarycolor,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide),
      fontFamily: 'Dm',
      textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontFamily: 'dmbold', fontSize: 45, color: Colors.white),
          headlineSmall: TextStyle(
              fontFamily: 'dmbold', fontSize: 30, color: Colors.white),
          labelMedium: TextStyle(fontSize: 15, color: Colors.black),
          bodySmall: TextStyle(fontSize: 25, color: Colors.grey),
          labelSmall: TextStyle(fontSize: 15, color: Colors.grey),
          bodyLarge: TextStyle(fontSize: 30, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 25, color: Colors.white)),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
          .copyWith(background: Colors.black))
};
