import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hymnal/ui/components/spinkit.dart';
import 'package:hymnal/ui/screens/grids.dart';
import 'package:hymnal/ui/utils/carouselmanager.dart';

import '../../bloc/hymnbloc/hymnbloc.dart';
import '../../bloc/hymnbloc/hymnstate.dart';
import '../components/searchfield.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                BlocBuilder<HymnBloc, HymnState>(
                  builder: (context, state) {
                    if (state is LoadedHymn) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CustomSearchField(
                          data: state.data,
                        ),
                      );
                    } else {
                      return const CustomSearchField(
                        data: [],
                      );
                    }
                  },
                ),
                BlocBuilder<HymnBloc, HymnState>(
                  builder: (context, state) {
                    if (state is LoadedHymn) {
                      return Songgrid(
                        hymnData: state.data,
                        carousel: Carouselmanager(),
                        crosssection: 2,
                        height: 800,
                      );
                    } else {
                      return spinkit;
                    }
                  },
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
