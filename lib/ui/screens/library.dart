import 'package:flutter/material.dart';
import 'package:hymnal/model/hymnmodel.dart';
import 'package:hymnal/ui/screens/grids.dart';
import 'package:hymnal/ui/utils/carouselmanager.dart';

class Lib extends StatefulWidget {
  const Lib({super.key});

  @override
  State<Lib> createState() => _LibState();
}

class _LibState extends State<Lib> {
  Carouselmanager carousel = Carouselmanager();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        primary: true,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40,
                        ),
                        child: SizedBox(
                            child: Text(
                          'Library',
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.headlineLarge,
                        )),
                      ),
                    ],
                  ),
                  Songgrid(
                    carousel: carousel,
                    crosssection: 2,
                    height: 600,
                    hymnData: [
                      HymnModel(id: 2, title: 'tite', content: 'content')
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
