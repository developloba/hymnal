import 'package:flutter/material.dart';
import 'package:hymnal/ui/utils/carouselmanager.dart';
import 'package:hymnal/ui/utils/constant.dart';

import '../components/carousel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                        mainAxisAlignment: MainAxisAlignment.end,
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
                            padding: const EdgeInsets.only(top: 30),
                            child: SizedBox(
                                width: 400,
                                child: Text(
                                  'Welcome back, Sis. Sarah👋',
                                  textAlign: TextAlign.start,
                                  style: ktitleblack,
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today's Selections",
                              style: kbodygrey,
                            ),
                            ElevatedButton(
                                onPressed: () {},
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
                    thickness: 10,
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
                              style: kbody,
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                          height: 400,
                          width: 600,
                          child: PageView.builder(
                              controller: PageController(viewportFraction: 0.5),
                              padEnds: false,
                              itemCount: carousel.carousel.length,
                              itemBuilder: ((context, index) => Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    color:
                                        const Color.fromARGB(57, 217, 217, 217),
                                    elevation: 0,
                                    child: Column(children: [
                                      Card(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        clipBehavior: Clip.hardEdge,
                                        child: carousel.carousel[index],
                                      ),
                                      Text(
                                        carousel.title[index],
                                        style: kbody,
                                      ),
                                      Text(
                                        carousel.artists[index],
                                        style: kbodygreysmall,
                                      )
                                    ]),
                                  ))),
                        ),
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
