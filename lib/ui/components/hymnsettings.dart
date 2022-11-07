import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hymnal/bloc/fontbloc.dart';

class Settings extends StatelessWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Reader Preferences',
              style: TextStyle(fontFamily: 'dm', fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                      onPressed: () {
                        BlocProvider.of<Fontbloc>(context).add(Increase());
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 50,
                      )),
                ),
                BlocBuilder<Fontbloc, double>(
                  builder: (context, state) {
                    return Text(
                      BlocProvider.of<Fontbloc>(context)
                          .state
                          .round()
                          .toString(),
                      style: const TextStyle(fontFamily: 'dm', fontSize: 40),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                      onPressed: () {
                        BlocProvider.of<Fontbloc>(context).add(Decrease());
                      },
                      icon: const Icon(
                        Icons.remove,
                        size: 50,
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
