import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hymnal/theme/themedata.dart';

class Themeevent {}

class Darkmode extends Themeevent {}

class Lightmode extends Themeevent {}

class Themestate {
  late final ThemeData? data;
  Themestate(this.data);
}

class Themebloc extends Bloc<Themeevent, Themestate> {
  Themebloc() : super(Themestate(appthemedata[Apptheme.lightTheme])) {
    on<Darkmode>((event, emit) {
      emit(Themestate(appthemedata[Apptheme.darkTheme]));
    });
    on<Lightmode>((event, emit) {
      emit(Themestate(appthemedata[Apptheme.lightTheme]));
    });
  }
}
