import 'package:flutter/material.dart';
import 'package:hymnal/utils/constant.dart';
import 'package:hymnal/screens/scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        navigationBarTheme: NavigationBarThemeData(
            backgroundColor: Colors.white,
            indicatorColor: kprimarycolorlight,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide),
        primarySwatch: Colors.blue,
      ),
      home: const Back(),
      debugShowCheckedModeBanner: false,
    );
  }
}
