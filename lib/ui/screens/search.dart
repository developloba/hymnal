import 'package:flutter/material.dart';
import 'package:hymnal/ui/components/searchfield.dart';
import 'package:hymnal/ui/screens/grids.dart';
import 'package:hymnal/ui/utils/carouselmanager.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'Search',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Searchfield(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Songgrid(
                    carousel: Carouselmanager(),
                    crosssection: 2,
                    height: 800,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
