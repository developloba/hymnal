import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hymnal/bloc/colorbloc.dart';
import 'package:hymnal/bloc/fontbloc.dart';
import 'package:hymnal/bloc/themebloc.dart';
import 'package:hymnal/ui/screens/scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Themebloc(),
      child: BlocBuilder<Themebloc, Themestate>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state.data,
            home: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => Fontbloc(),
                ),
                BlocProvider(
                  create: (context) => Colorbloc(),
                ),
              ],
              child: const Scaffold(body: Back()),
            ),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
