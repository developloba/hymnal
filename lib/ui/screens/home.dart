import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hymnal/bloc/hymnbloc/hymnevent.dart';
import 'package:hymnal/bloc/hymnbloc/hymnstate.dart';
import 'package:hymnal/ui/components/hymnscreen.dart';
import 'package:hymnal/ui/components/spinkit.dart';
import 'package:hymnal/ui/utils/carouselmanager.dart';

import '../../bloc/hymnbloc/hymnbloc.dart';
import '../../model/hymnmodel.dart';
import '../components/carousel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<HymnBloc>(context).add(GetHymnEvent());
    super.initState();
  }

  Carouselmanager carousel = Carouselmanager();
  PageController controls = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40, bottom: 20),
                            child: SizedBox(
                                width: 400,
                                child: Text(
                                  'Welcome back, Sis. Sarah👋',
                                  textAlign: TextAlign.start,
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Today's Selections",
                                style: Theme.of(context).textTheme.bodyLarge),
                            ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<HymnBloc>(context)
                                      .add(GetHymnEvent());
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  backgroundColor: Colors.grey[100],
                                  elevation: 0,
                                ),
                                child: const Text(
                                  'View',
                                  style: TextStyle(
                                      fontFamily: 'dm', color: Colors.black),
                                ))
                          ],
                        ),
                      ),
                      Selections(controls: controls, carousel: carousel),
                      Crumbs(controls: controls, carousel: carousel),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    thickness: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Based on what you've viewed",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Theme.of(context).primaryColor,
                            )
                          ],
                        ),
                      ),
                      BlocBuilder<HymnBloc, HymnState>(
                        builder: (context, state) {
                          if (state is LoadedHymn) {
                            return HymnCarousel(
                              carousel: carousel,
                              data: state.data,
                            );
                          } else if (state is InitialHymnState) {
                            return spinkit;
                          } else {
                            return const Text('error');
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HymnCarousel extends StatelessWidget {
  const HymnCarousel({Key? key, required this.carousel, required this.data})
      : super(key: key);

  final Carouselmanager carousel;
  final List<HymnModel> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 400,
        width: 600,
        child: PageView.builder(
            controller: PageController(viewportFraction: 0.5),
            padEnds: false,
            itemCount: data.length,
            itemBuilder: ((context, index) => Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  color: const Color.fromARGB(57, 217, 217, 217),
                  elevation: 0,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    TextButton(
                      onPressed: (() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              body: HymnscreenScaffold(
                                  backgroundcolor:
                                      Theme.of(context).colorScheme.background,
                                  textcolor: Theme.of(context).primaryColor,
                                  hymnData: data[index]),
                            ),
                          ),
                        );
                      }),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        clipBehavior: Clip.hardEdge,
                        child: carousel.carousel[5],
                      ),
                    ),
                    Text(
                      data[index].title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ]),
                ))),
      ),
    );
  }
}
