import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/carouselmanager.dart';
import '../utils/constant.dart';

class Selections extends StatelessWidget {
  const Selections({
    Key? key,
    required this.controls,
    required this.carousel,
  }) : super(key: key);

  final PageController controls;
  final Carouselmanager carousel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: PageView.builder(
          controller: controls,
          itemCount: carousel.carousel.length,
          padEnds: false,
          itemBuilder: ((context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SizedBox(
                      width: 550,
                      height: 380,
                      child: Card(
                        elevation: 0,
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: carousel.carousel[index],
                      ),
                    ),
                  ),
                  Text(
                    carousel.title[index],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    carousel.artists[index],
                    style: kbodygreysmall,
                  )
                ],
              ))),
    );
  }
}

class Crumbs extends StatelessWidget {
  const Crumbs({
    Key? key,
    required this.controls,
    required this.carousel,
  }) : super(key: key);

  final PageController controls;
  final Carouselmanager carousel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SmoothPageIndicator(
          controller: controls, // PageController
          count: carousel.carousel.length,
          effect: WormEffect(
              dotColor: Colors.grey.shade200,
              activeDotColor: kprimarycolor,
              type: WormType.thin), // your preferred effect
          onDotClicked: (index) {}),
    );
  }
}
