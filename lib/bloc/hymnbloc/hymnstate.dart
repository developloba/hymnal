import 'package:equatable/equatable.dart';
import 'package:hymnal/model/hymnmodel.dart';

class HymnState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class LoadedHymn extends HymnState {
  List<HymnModel> data;
  LoadedHymn(this.data);
}

class InitialHymnState extends HymnState {}
