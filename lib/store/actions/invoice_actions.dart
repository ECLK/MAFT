import 'package:tabulation/store/models/invoice_response.dart';

class PostInvoiceAction {
  int electionId;
  int issuedToId;
  int issuingOfficeId;
  int receivingOfficeId;

  PostInvoiceAction(this.electionId, this.issuedToId, this.issuingOfficeId,
      this.receivingOfficeId);
      
}

class InvoiceResponseAction{
  final InvoiceModel invoice;

  InvoiceResponseAction(this.invoice);
}

class UpdateIssuingOffice{
  final int issuingOfficeId;
  UpdateIssuingOffice(this.issuingOfficeId);
}

class UpdateReceivingOffice{
  final int receivingOfficeId;
  UpdateReceivingOffice(this.receivingOfficeId);
}

class NavigateToIssuingStepTwoAction{}