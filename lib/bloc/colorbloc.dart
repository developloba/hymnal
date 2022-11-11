import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class Colorbloc extends Bloc<Colorevent, Modecolor> {
  Colorbloc()
      : super(Modecolor(
            backgroundcolor: Colors.white,
            textcolor: Colors.black,
            darktheme: false)) {
    on<Lightmode>((event, emit) =>
        state ==
        Modecolor(
            backgroundcolor: Colors.white,
            textcolor: Colors.black,
            darktheme: false));
    on<Darkmode>((event, emit) =>
        state ==
        Modecolor(
            backgroundcolor: Colors.black,
            textcolor: Colors.white,
            darktheme: true));
  }
}

class Colorevent {}

class Lightmode extends Colorevent {}

class Darkmode extends Colorevent {}

class Modecolor {
  late Color textcolor;
  late Color backgroundcolor;
  late bool darktheme;
  Modecolor(
      {required this.backgroundcolor,
      required this.textcolor,
      required this.darktheme});
}
