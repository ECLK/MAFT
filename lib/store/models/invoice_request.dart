class InvoiceRequestModel {
  int electionId;
  int issuedToId;
  int issuingOfficeId;
  int receivingOfficeId;

  InvoiceRequestModel(
      {this.electionId,
      this.issuedToId,
      this.issuingOfficeId,
      this.receivingOfficeId});
}
