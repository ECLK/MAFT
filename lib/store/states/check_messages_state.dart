import 'package:flutter/material.dart';

class CheckMessagesState {
  final int countingCenterId;
  final int electoralDistrictId;
  final int pollingDivisionId;
  final int pollingStationId;
  final TimeOfDay time;
  final String nameARO;
  final String remarks;

  CheckMessagesState({
    this.countingCenterId,
    this.electoralDistrictId,
    this.pollingDivisionId,
    this.pollingStationId,
    this.time,
    this.nameARO,
    this.remarks
  });

  factory CheckMessagesState.initial() {
    return new CheckMessagesState(
        countingCenterId: null,
        electoralDistrictId: null,
        pollingDivisionId: null,
        pollingStationId: null,
        time:null,
        nameARO: null,
        remarks: null);
  }

  CheckMessagesState copyWith(
      {int countingCenterId,
      int electoralDistrictId,
      int pollingDivisionId,
      int pollingStationId,
      TimeOfDay time,
      String nameARO,
      String remarks}) {
    return new CheckMessagesState(
        countingCenterId: countingCenterId ?? this.countingCenterId,
        electoralDistrictId: electoralDistrictId ?? this.electoralDistrictId,
        pollingDivisionId: pollingDivisionId ?? this.pollingDivisionId,
        pollingStationId: pollingStationId ?? this.pollingStationId,
        time:time ?? this.time,
        nameARO: nameARO ?? this.nameARO,
        remarks:remarks ?? this.remarks);
  }
}
