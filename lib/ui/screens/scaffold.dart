import 'package:flutter/material.dart';
import 'package:hymnal/ui/screens/Library.dart';
import 'package:hymnal/ui/screens/home.dart';
import 'package:hymnal/ui/screens/search.dart';
import 'package:hymnal/ui/screens/setting.dart';

class Back extends StatefulWidget {
  const Back({super.key});

  @override
  State<Back> createState() => _BackState();
}

class _BackState extends State<Back> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: Theme.of(context).backgroundColor,
        child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            selectedIndex: currentPageIndex,
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: 'Search'),
              NavigationDestination(
                  icon: Icon(
                    Icons.book_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: 'Library'),
              NavigationDestination(
                  icon: Icon(
                    Icons.settings_outlined,
                    color: Theme.of(context).primaryColor,
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
