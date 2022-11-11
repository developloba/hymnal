import 'package:flutter/material.dart';
import 'package:hymnal/ui/utils/carouselmanager.dart';

class Songgrid extends StatelessWidget {
  const Songgrid(
      {Key? key,
      required this.carousel,
      required this.crosssection,
      required this.height})
      : super(key: key);

  final Carouselmanager carousel;
  final int crosssection;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: GridView.builder(
        itemCount: carousel.carousel.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,
            mainAxisSpacing: 20,
            crossAxisCount: crosssection,
            crossAxisSpacing: 20),
        itemBuilder: (context, index) => SizedBox(
          height: 400,
          width: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: carousel.carousel[index],
              ),
              Text(
                carousel.title[index],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                carousel.artists[index],
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
