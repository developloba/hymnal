import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hymnal/model/hymnmodel.dart';
import 'package:hymnal/ui/components/hymnsettings.dart';

import '../../bloc/fontbloc.dart';
import '../utils/constant.dart';

class HymnscreenScaffold extends StatelessWidget {
  const HymnscreenScaffold(
      {super.key,
      required this.backgroundcolor,
      required this.textcolor,
      required this.hymnData});
  final Color backgroundcolor;
  final Color textcolor;

  final HymnModel hymnData;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Fontbloc(),
      child: Scaffold(
        body: Hymnscreen(
          backgroundcolor: Theme.of(context).scaffoldBackgroundColor,
          textcolor: textcolor,
          hymnData: hymnData,
        ),
      ),
    );
  }
}

class Hymnscreen extends StatefulWidget {
  const Hymnscreen(
      {Key? key,
      required this.backgroundcolor,
      required this.textcolor,
      required this.hymnData})
      : super(key: key);

  final Color backgroundcolor;
  final Color textcolor;

  final HymnModel hymnData;

  @override
  State<Hymnscreen> createState() => _HymnscreenState();
}

class _HymnscreenState extends State<Hymnscreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    AnimationController bottomSheetController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    return Scaffold(
      backgroundColor: widget.backgroundcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: (() => Navigator.pop(context)),
              icon: (Icon(
                Icons.arrow_back_ios_new_sharp,
                color: widget.textcolor,
              )),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 150,
              child: Center(
                child: Text(
                  widget.hymnData.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 25),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            AnimatedBuilder(
                animation: bottomSheetController,
                builder: (context, child) {
                  if (bottomSheetController.value == 0) {
                    return IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        color: kprimarycolor,
                      ),
                      onPressed: () {
                        Scaffold.of(context).showBottomSheet(
                            transitionAnimationController:
                                bottomSheetController,
                            (context) => const Hymnsettings(),
                            backgroundColor: Colors.transparent);
                      },
                    );
                  } else {
                    return IconButton(
                        icon: Icon(
                          Icons.close,
                          color: kprimarycolor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        });
                  }
                })
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: BlocBuilder<Fontbloc, double>(
                builder: (context, state) {
                  return Text(widget.hymnData.content,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: state));
                },
              ))
            ],
          )),
    );
  }
}
