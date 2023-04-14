import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hymnal/bloc/colorbloc.dart';
import 'package:hymnal/bloc/fontbloc.dart';
import 'package:hymnal/bloc/themebloc.dart';
import 'package:hymnal/data/hymnservice.dart';
import 'package:hymnal/ui/screens/scaffold.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'bloc/hymnbloc/hymnbloc.dart';

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
            builder: (context, child) => ResponsiveWrapper.builder(
              child,
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(480, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
            ),
            title: 'Flutter Demo',
            theme: state.data,
            home: RepositoryProvider(
              create: (context) => HymnService(),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => Fontbloc(),
                  ),
                  BlocProvider(
                    create: (context) =>
                        HymnBloc(RepositoryProvider.of<HymnService>(context)),
                  ),
                  BlocProvider(
                    create: (context) => Colorbloc(),
                  ),
                ],
                child: const Scaffold(body: Back()),
              ),
            ),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
