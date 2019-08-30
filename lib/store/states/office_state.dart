import 'package:meta/meta.dart';
import 'package:tabulation/store/models/office_request.dart';

@immutable
class OfficeState {
  final List<Office> offices;

  OfficeState({
    @required this.offices,
  });

  factory OfficeState.initial() {
    return new OfficeState(offices: new List());
  }

  OfficeState copyWith({
    List<Office> offices,
  }) {
    return new OfficeState(offices: offices ?? this.offices);
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
