import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hymnal/ui/components/hymnmanager.dart';
import 'package:hymnal/ui/components/hymnsettings.dart';

import '../../bloc/fontbloc.dart';
import '../utils/constant.dart';

class Hymnscreen extends StatelessWidget {
  const Hymnscreen({
    Key? key,
    required this.backgroundcolor,
    required this.textcolor,
    required this.verses,
  }) : super(key: key);

  final Color backgroundcolor;
  final Color textcolor;
  final Hymnmanager verses;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundcolor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: textcolor,
                ),
                Text(
                  'Nearer my God to thee',
                  style: TextStyle(
                      fontFamily: 'dmbold', fontSize: 30, color: textcolor),
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: kprimarycolor,
                  ),
                  onPressed: () {
                    Scaffold.of(context)
                        .showBottomSheet((context) => const Hymnsettings());
                  },
                )
              ],
            ),
            backgroundColor: Colors.transparent,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 70,
              width: 500,
              child: BlocBuilder<Fontbloc, double>(
                builder: (context, state) {
                  return ListView.builder(
                      itemCount: verses.verses.length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 40),
                            child: SizedBox(
                              width: 500,
                              child: Text(
                                verses.verses[index],
                                style: TextStyle(
                                    color: textcolor,
                                    fontFamily: 'dm',
                                    fontSize: BlocProvider.of<Fontbloc>(context)
                                        .state),
                              ),
                            ),
                          ));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
