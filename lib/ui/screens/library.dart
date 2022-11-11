import 'package:flutter/material.dart';
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
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.notifications,
                        color: Colors.grey,
                        size: 40,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 20),
                        child: SizedBox(
                            width: 500,
                            child: Text(
                              'Here are all your saved songs',
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.headlineLarge,
                            )),
                      ),
                    ],
                  ),
                  Songgrid(
                    carousel: carousel,
                    crosssection: 3,
                    height: 600,
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
