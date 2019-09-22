import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/invoice_actions.dart';
import 'package:tabulation/store/models/invoice_response.dart';
import 'package:tabulation/store/states/invoice_state.dart';

final invoiceReducer = combineReducers<InvoiceState>([
  TypedReducer<InvoiceState, InvoiceModel>(_invoiceAction),
  TypedReducer<InvoiceState, InvoiceResponseAction>(_invoiceResponseAction),
  TypedReducer<InvoiceState, UpdateIssuingOffice>(_updateIssuingOfficeAction),
  TypedReducer<InvoiceState, UpdateReceivingOffice>(_updateReceivingOffice),
  TypedReducer<InvoiceState, ClearInvoiceAction>(_clearInvoiceAction)
]);

InvoiceState _invoiceAction(InvoiceState state, InvoiceModel action) => state;

InvoiceState _invoiceResponseAction(
    InvoiceState state, InvoiceResponseAction action) {
  return state.copyWith(
      confirmed: action.invoice.confirmed,
      electionId: action.invoice.electionId,
      officeId: action.invoice.issuingOfficeId,
      invoiceId: action.invoice.invoiceId,
      delete: action.invoice.delete,
      issuedAt: action.invoice.issuedAt,
      issuedBy: action.invoice.issuedBy,
      issuedTo: action.invoice.issuedTo,
      issuingOfficeId: action.invoice.issuingOfficeId,
      receivingOfficeId: action.invoice.receivingOfficeId);
}

InvoiceState _updateIssuingOfficeAction(
    InvoiceState state, UpdateIssuingOffice action) {
  return state.copyWith(issuingOfficeId: action.issuingOfficeId);
}

InvoiceState _updateReceivingOffice(
    InvoiceState state, UpdateReceivingOffice action) {
  return state.copyWith(receivingOfficeId: action.receivingOfficeId);
}

InvoiceState _clearInvoiceAction(
    InvoiceState state, ClearInvoiceAction action) {
  return InvoiceState.initial();
}
