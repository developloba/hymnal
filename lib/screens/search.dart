import 'package:flutter/cupertino.dart';
import 'package:hymnal/components/searchfield.dart';
import 'package:hymnal/screens/grids.dart';
import 'package:hymnal/utils/carouselmanager.dart';
import 'package:hymnal/utils/constant.dart';

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
                    style: ktitleblack,
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
