import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hymnal/bloc/fontbloc.dart';

import '../../bloc/themebloc.dart';

class Hymnsettings extends StatelessWidget {
  const Hymnsettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reader Preferences',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.black, fontSize: 35),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconButton(
                      onPressed: () {
                        BlocProvider.of<Fontbloc>(context).add(Increase());
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 50,
                        color: Colors.black,
                      )),
                ),
                BlocBuilder<Fontbloc, double>(
                  builder: (context, state) {
                    return Text(
                      state.round().toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.black),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconButton(
                      onPressed: () {
                        BlocProvider.of<Fontbloc>(context).add(Decrease());
                      },
                      icon: const Icon(
                        Icons.remove,
                        size: 50,
                        color: Colors.black,
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (() =>
                      BlocProvider.of<Themebloc>(context).add(Lightmode())),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (() =>
                      BlocProvider.of<Themebloc>(context).add(Darkmode())),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
