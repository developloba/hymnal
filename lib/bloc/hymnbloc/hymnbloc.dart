import 'package:bloc/bloc.dart';
import 'package:hymnal/bloc/hymnbloc/hymnevent.dart';
import 'package:hymnal/bloc/hymnbloc/hymnstate.dart';
import 'package:hymnal/data/hymnservice.dart';
import 'package:hymnal/model/hymnmodel.dart';

class HymnBloc extends Bloc<HymnEvent, HymnState> {
  HymnService service;
  HymnBloc(this.service) : super(InitialHymnState()) {
    on<GetHymnEvent>((event, emit) async {
      List<HymnModel> data = await service.getSongs();
      emit(LoadedHymn(data));
    });
  }
}
