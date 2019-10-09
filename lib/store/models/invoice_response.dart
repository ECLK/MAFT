import 'package:tabulation/store/states/invoice_state.dart';

class InvoiceModel {
  bool confirmed;
  bool delete;
  int electionId;
  int invoiceId;
  String issuedAt;
  int issuedBy;
  int issuedTo;
  int issuingOfficeId;
  int receivingOfficeId;
  int issuingDistrictId;
  int issuingPollingDivisionId;
  int receivingPollingDivisionId;
  int receivingDistrictId;
  
  InvoiceModel(
      {this.confirmed,
      this.delete,
      this.electionId,
      this.invoiceId,
      this.issuedAt,
      this.issuedBy,
      this.issuedTo,
      this.issuingOfficeId,
      this.receivingOfficeId,
      this.issuingDistrictId,
      this.receivingDistrictId,
      this.issuingPollingDivisionId,
      this.receivingPollingDivisionId});

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    return new InvoiceModel(
      confirmed: json['confirmed'],
      delete: json['delete'],
      electionId: json['electionId'],
      invoiceId: json['invoiceId'],
      issuedAt: json['issuedAt'],
      issuedBy: json['issuedBy'],
      issuedTo: json['issuedTo'],
      issuingOfficeId: json['issuingOfficeId:'],
      receivingOfficeId: json['receivingOfficeId'],

    );
  }

  factory InvoiceModel.fromState(InvoiceState state) {
    return new InvoiceModel(
      confirmed: state.confirmed,
      delete: state.delete,
      electionId: state.electionId,
      invoiceId: state.invoiceId,
      issuedAt: state.issuedAt,
      issuedBy: state.issuedBy,
      issuedTo: state.issuedToId,
      issuingOfficeId: state.issuingOfficeId,
      receivingOfficeId: state.receivingOfficeId,
      issuingDistrictId: state.issuingDistrictId,
      receivingDistrictId:state.receivingDistrictId,
      receivingPollingDivisionId: state.receivingPollingDivisionId,
      issuingPollingDivisionId:state.issuingPollingDivisionId
    );
  }
}
