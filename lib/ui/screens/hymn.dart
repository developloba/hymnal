import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hymnal/bloc/fontbloc.dart';
import 'package:hymnal/ui/components/hymnmanager.dart';
import 'package:hymnal/ui/components/hymnsettings.dart';
import 'package:hymnal/ui/utils/constant.dart';

class Hymn extends StatefulWidget {
  const Hymn({super.key});

  @override
  State<Hymn> createState() => _HymnState();
}

class _HymnState extends State<Hymn> {
  Hymnmanager verses = Hymnmanager();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.black,
              ),
              const Text(
                'Nearer my God to thee',
                style: TextStyle(
                    fontFamily: 'dmbold', fontSize: 30, color: Colors.black),
              ),
              IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: kprimarycolor,
                ),
                onPressed: () {
                  Scaffold.of(context)
                      .showBottomSheet((context) => const Settings());
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
                                  fontFamily: 'dm',
                                  fontSize:
                                      BlocProvider.of<Fontbloc>(context).state),
                            ),
                          ),
                        ));
              },
            ),
          ),
        )
      ],
    );
  }
}
