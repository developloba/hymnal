import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class Colorbloc extends Bloc<Colorevent, Modecolor> {
  Colorbloc()
      : super(
            Modecolor(backgroundcolor: Colors.white, textcolor: Colors.black)) {
    on<Lightmode>((event, emit) =>
        state ==
        Modecolor(backgroundcolor: Colors.white, textcolor: Colors.black));
    on<Darkmode>((event, emit) =>
        state ==
        Modecolor(backgroundcolor: Colors.black, textcolor: Colors.white));
  }
}

class Colorevent {}

class Lightmode extends Colorevent {}

class Darkmode extends Colorevent {}

class Modecolor {
  late Color textcolor;
  late Color backgroundcolor;
  Modecolor({required this.backgroundcolor, required this.textcolor});
}
