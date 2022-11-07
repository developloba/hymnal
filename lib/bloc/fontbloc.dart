import 'package:bloc/bloc.dart';

class Fontbloc extends Bloc<Fontchangeevent, double> {
  Fontbloc() : super(25) {
    on<Increase>((event, emit) => emit(state + 5));
    on<Decrease>(
      (event, emit) => emit(state - 5),
    );
  }
}

class Fontchangeevent {}

class Increase extends Fontchangeevent {}

class Decrease extends Fontchangeevent {}
