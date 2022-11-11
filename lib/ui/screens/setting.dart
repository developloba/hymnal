import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hymnal/bloc/themebloc.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<bool> selected = [true, false];

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
                    style: Theme.of(context).textTheme.headlineLarge,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Settingtile(
                                label: 'Edit Profile',
                              ),
                              const Settingtile(
                                label: 'Favorites',
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Preferences',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  ToggleButtons(
                                      isSelected: selected,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      selectedColor: Colors.white,
                                      fillColor: Colors.grey,
                                      color: Colors.grey,
                                      onPressed: ((index) {
                                        setState(() {
                                          selected[index] = !selected[index];
                                          if (index == 0 && selected[index]) {
                                            BlocProvider.of<Themebloc>(context)
                                                .add(Lightmode());
                                            selected[index + 1] = false;
                                          } else if (index == 0 &&
                                              !selected[index]) {
                                            BlocProvider.of<Themebloc>(context)
                                                .add(Darkmode());
                                            selected[index + 1] = true;
                                          }
                                          if (index == 1 && selected[index]) {
                                            BlocProvider.of<Themebloc>(context)
                                                .add(Darkmode());
                                            selected[index - 1] = false;
                                          } else if (index == 1 &&
                                              !selected[index]) {
                                            BlocProvider.of<Themebloc>(context)
                                                .add(Lightmode());
                                            selected[index - 1] = true;
                                          }
                                        });
                                      }),
                                      children: const [
                                        Icon(Icons.light_mode),
                                        Icon(Icons.dark_mode)
                                      ]),
                                ],
                              ),
                              const Settingtile(
                                label: 'Log out',
                              )
                            ],
                          )),
                    ))
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class Settingtile extends StatelessWidget {
  const Settingtile({Key? key, required this.label}) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 50,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}
