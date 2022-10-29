import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hymnal/screens/Library.dart';
import 'package:hymnal/screens/home.dart';
import 'package:hymnal/screens/search.dart';
import 'package:hymnal/screens/setting.dart';

class Back extends StatefulWidget {
  const Back({super.key});

  @override
  State<Back> createState() => _BackState();
}

class _BackState extends State<Back> {
  int currentPageIndex = 0;
  SystemUiOverlayStyle overlayStyle = const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            selectedIndex: currentPageIndex,
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  label: 'Home'),
              NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
              NavigationDestination(
                  icon: Icon(Icons.book_outlined), label: 'Library'),
              NavigationDestination(
                  icon: Icon(
                    Icons.settings_outlined,
                  ),
                  label: 'settings')
            ]),
      ),
      body: [
        const Home(),
        const Search(),
        const Lib(),
        const Settings()
      ][currentPageIndex],
    );
  }
}
