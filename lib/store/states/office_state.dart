import 'package:meta/meta.dart';
import 'package:tabulation/store/models/area_model.dart';
import 'package:tabulation/store/models/election_model.dart';
import 'package:tabulation/store/models/subelection_model.dart';

@immutable
class OfficeState {
  final List<Area> areas;
  final List<Election> elections;
  final Election selectedElection;
  final SubElection selectedSubElection;

  OfficeState({
    this.areas,
    this.elections,
    this.selectedElection,
    this.selectedSubElection,
  });

  factory OfficeState.initial() {
    return new OfficeState(
        areas: new List<Area>(),
        elections: new List<Election>(),
        selectedElection: new Election(),
        selectedSubElection: new SubElection());
  }

  OfficeState copyWith({
    List<Area> areas,
    List<Election> elections,
    Election selectedElection,
    SubElection selectedSubElection,
  }) {
    return new OfficeState(
        areas: areas ?? this.areas,
        elections: elections ?? this.elections,
        selectedElection: selectedElection ?? this.selectedElection,
        selectedSubElection: selectedSubElection ?? this.selectedSubElection);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfficeState &&
          runtimeType == other.runtimeType &&
          areas == other.areas;

  @override
  int get hashCode => areas.hashCode;
}
