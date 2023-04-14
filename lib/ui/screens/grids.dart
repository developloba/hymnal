import 'package:flutter/material.dart';
import 'package:hymnal/model/hymnmodel.dart';
import 'package:hymnal/ui/utils/carouselmanager.dart';

import '../components/hymnscreen.dart';

class Songgrid extends StatefulWidget {
  const Songgrid(
      {Key? key,
      required this.carousel,
      required this.crosssection,
      required this.height,
      required this.hymnData})
      : super(key: key);

  final Carouselmanager carousel;
  final int crosssection;
  final double height;
  final List<HymnModel> hymnData;

  @override
  State<Songgrid> createState() => _SonggridState();
}

class _SonggridState extends State<Songgrid> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        itemCount: widget.hymnData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8,
            mainAxisSpacing: 3,
            crossAxisCount: widget.crosssection,
            crossAxisSpacing: 3),
        itemBuilder: (context, index) => TextButton(
          onPressed: (() {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HymnscreenScaffold(
                  backgroundcolor: Theme.of(context).colorScheme.background,
                  textcolor: Theme.of(context).primaryColor,
                  hymnData: widget.hymnData[index]),
            ));
          }),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: widget.carousel.carousel[4],
              ),
              Text(
                widget.hymnData[index].title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
