import 'package:tabulation/store/models/invoice_response.dart';

class PostInvoiceAction {
  int electionId;
  int issuedToId;
  int issuingOfficeId;
  int receivingOfficeId;
  int receivingDistrictId;
  int issuingDistrictId;

  PostInvoiceAction(this.electionId, this.issuedToId, this.issuingOfficeId,
      this.receivingOfficeId, this.receivingDistrictId, this.issuingDistrictId);
}

class PostInvoiceActionPv {
  int electionId;
  int issuedToId;
  int issuingOfficeId;
  int receivingOfficeId;

  PostInvoiceActionPv(this.electionId, this.issuedToId, this.issuingOfficeId,
      this.receivingOfficeId);
}

class PostInvoiceActionPvR {
  int electionId;
  int issuedToId;
  int issuingOfficeId;
  int receivingOfficeId;

  PostInvoiceActionPvR(this.electionId, this.issuedToId, this.issuingOfficeId,
      this.receivingOfficeId);
}

class PostInvoiceReceivingAction {
  int electionId;
  int issuedToId;
  int issuingOfficeId;
  int receivingOfficeId;
  int receivingDistrictId;
  int issuingDistrictId;

  PostInvoiceReceivingAction(
      this.electionId,
      this.issuedToId,
      this.issuingOfficeId,
      this.receivingOfficeId,
      this.receivingDistrictId,
      this.issuingDistrictId);
}

class InvoiceResponseAction {
  final InvoiceModel invoice;

  InvoiceResponseAction(this.invoice);
}

class UpdateIssuingOffice {
  final int issuingOfficeId;
  UpdateIssuingOffice(this.issuingOfficeId);
}

class UpdateReceivingOffice {
  final int receivingOfficeId;
  UpdateReceivingOffice(this.receivingOfficeId);
}

class UpdateIssuingDistrictId {
  final int districtId;
  UpdateIssuingDistrictId(this.districtId);
}

class UpdateReceivingDistrictId {
  final int districtId;
  UpdateReceivingDistrictId(this.districtId);
}

class UpdateIssuingPollingStationId {
  final int id;
  UpdateIssuingPollingStationId(this.id);
}

class UpdateReceivingPollingStationId {
  final int receivingPollingStationId;
  UpdateReceivingPollingStationId(this.receivingPollingStationId);
}

class UpdateIssuingPollingDivisionId {
  final int id;
  UpdateIssuingPollingDivisionId(this.id);
}

class UpdateReceivingPollingDivisionId {
  final int id;
  UpdateReceivingPollingDivisionId(this.id);
}

class ConfirmInvoiceAction {
  int invoiceId;

  ConfirmInvoiceAction(this.invoiceId);
}

class ConfirmInvoiceActionReceiving {
  int invoiceId;

  ConfirmInvoiceActionReceiving(this.invoiceId);
}

class NavigateToInvoiceSuccess {}

class NavigateToInvoiceReceivingSuccess {}

class ClearInvoiceAction {
  ClearInvoiceAction();
}

class NavigateToIssuingStepTwoAction {}

class NavigateToReceivingStepTwoAction {}

class NavigateToIssuingPvStepTwoAction {}

class NavigateToReceivingPvStepTwoAction {}
