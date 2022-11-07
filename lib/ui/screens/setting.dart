import 'package:flutter/material.dart';
import 'package:hymnal/ui/utils/constant.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> settings = [
    'Edit Profile',
    'Favourites',
    'Preferences',
    'Theme',
    'Log out',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/woman.jpg',
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Sarah Fitzelburger',
                    textAlign: TextAlign.start,
                    style: ktitleblack,
                  ),
                ),
                SizedBox(
                    width: 500,
                    height: 500,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      color: const Color.fromARGB(48, 210, 210, 210),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        child: SizedBox(
                          height: 500,
                          child: ListView.builder(
                              itemCount: settings.length,
                              itemBuilder: ((context, index) => Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            child: Text(
                                              settings[index],
                                              style: kbody,
                                            ),
                                          ),
                                          const Icon(Icons.arrow_forward_ios)
                                        ],
                                      ),
                                      const Divider()
                                    ],
                                  ))),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        )
      ],
    ));
  }
}
