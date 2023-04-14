// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hymnal/bloc/colorbloc.dart';
// import 'package:hymnal/ui/components/hymnmanager.dart';
// import 'package:hymnal/ui/components/hymnscreen.dart';

// class Hymn extends StatefulWidget {
//   const Hymn({super.key});

//   @override
//   State<Hymn> createState() => _HymnState();
// }

// class _HymnState extends State<Hymn> {
//   Hymnmanager verses = Hymnmanager();

//   @override
//   Widget build(BuildContext context) {
//     Color textcolor = Colors.black;
//     Color backgroundcolor = Colors.white;
//     return BlocConsumer<Colorbloc, Modecolor>(
//       listener: (context, state) {
//         if (state.darktheme == true) {
//           backgroundcolor = Colors.black54;
//         } else if (state.darktheme == false) {
//           backgroundcolor = Colors.yellow;
//         }
//       },
//       builder: (context, state) {
//         return Hymnscreen(
//             backgroundcolor: backgroundcolor,
//             textcolor: textcolor,
//             verses: verses);
//       },
//     );
//   }
// }
