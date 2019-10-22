import 'package:meta/meta.dart';

@immutable
class InvoiceState {
  final bool confirmed;
  final int electionId;
  final int officeId;
  final String officeName;
  final String officeType;
  final int invoiceId;
  final bool delete;
  final String issuedAt;
  final int issuedBy;
  final int issuedToId;
  final int issuingOfficeId;
  final int receivingOfficeId;
  final int issuingDistrictId;
  final int receivingDistrictId;
  final int issuingPollingDivisionId;
  final int receivingPollingDivisionId;
  final int receivingPollingStationId;
  final int issuingPollingStationId;

  InvoiceState(
      {this.confirmed,
      this.electionId,
      this.officeId,
      this.officeName,
      this.officeType,
      this.invoiceId,
      this.delete,
      this.issuedAt,
      this.issuedBy,
      this.issuedToId,
      this.issuingOfficeId,
      this.receivingOfficeId,
      this.issuingDistrictId,
      this.receivingDistrictId,
      this.issuingPollingDivisionId,
      this.receivingPollingDivisionId,
      this.receivingPollingStationId,
      this.issuingPollingStationId});

  InvoiceState copyWith(
      {bool confirmed,
      int electionId,
      int officeId,
      String officeName,
      String officeType,
      int invoiceId,
      bool delete,
      String issuedAt,
      int issuedBy,
      int issuedTo,
      int issuingOfficeId,
      int receivingOfficeId,
      int issuingDistrictId,
      int receivingDistrictId,
      int issuingPollingDivisionId,
      int receivingPollingDivisionId,
      int receivingPollingStationId,
      int issuingPollingStationId}) {
    return new InvoiceState(
        confirmed: confirmed ?? this.confirmed,
        electionId: electionId ?? this.electionId,
        officeId: officeId ?? this.officeId,
        officeName: officeName ?? this.officeName,
        officeType: officeType ?? this.officeType,
        invoiceId: invoiceId ?? this.invoiceId,
        delete: delete ?? this.delete,
        issuedAt: issuedAt ?? this.issuedAt,
        issuedBy: invoiceId ?? this.issuedBy,
        issuedToId: issuedTo ?? this.issuedToId,
        issuingOfficeId: issuingOfficeId ?? this.issuingOfficeId,
        receivingOfficeId: receivingOfficeId ?? this.receivingOfficeId,
        issuingDistrictId: issuingDistrictId ?? this.issuingDistrictId,
        receivingDistrictId: receivingDistrictId ?? this.receivingDistrictId,
        issuingPollingDivisionId:
            issuingPollingDivisionId ?? this.issuingPollingDivisionId,
        receivingPollingDivisionId:
            receivingPollingDivisionId ?? this.receivingPollingDivisionId,
        receivingPollingStationId:
            receivingPollingStationId ?? this.receivingPollingStationId,
        issuingPollingStationId:
            issuingPollingStationId ?? this.issuingPollingStationId);
  }

  factory InvoiceState.initial() {
    return new InvoiceState(
        confirmed: false,
        electionId: 0,
        officeId: 0,
        officeName: "",
        officeType: "",
        invoiceId: 0,
        delete: false,
        issuedAt: "",
        issuedBy: 0,
        issuedToId: 0,
        issuingOfficeId: null,
        receivingOfficeId: null,
        issuingDistrictId: null,
        receivingDistrictId: null,
        issuingPollingDivisionId: null,
        receivingPollingDivisionId: null,
        receivingPollingStationId: null,
        issuingPollingStationId:null);
  }
}
