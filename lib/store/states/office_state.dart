import 'package:meta/meta.dart';
import 'package:tabulation/store/models/office_request.dart';

@immutable
class OfficeState {
  final List<Office> offices;
  final List<Office> elections;
  final Office selectedElection;

  OfficeState({
    this.offices,
    this.elections,
    this.selectedElection,
  });

  factory OfficeState.initial() {
    return new OfficeState(
        offices: new List<Office>(),
        elections: new List<Office>(),
        selectedElection: new Office());
  }

  OfficeState copyWith({
    List<Office> offices,
    List<Office> elections,
    Office selectedElection,
  }) {
    return new OfficeState(
        offices: offices ?? this.offices,
        elections: elections ?? this.elections,
        selectedElection: selectedElection ?? this.selectedElection);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfficeState &&
          runtimeType == other.runtimeType &&
          offices == other.offices;

  @override
  int get hashCode => offices.hashCode;
}
