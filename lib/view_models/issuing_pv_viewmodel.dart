import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/invoice_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/invoice_response.dart';
import 'package:tabulation/store/models/office_request.dart';

class IssuingPvViewModel {
  final List<Office> offices;
  final InvoiceModel invoice;
  final Function() createInvoice;
  final Function navigateToIssuingStepTwoAction;
  final Function(int issuingOfficeId) updateIssuingOffice;
  final Function(int receivingOfficeId) updateReceivingOffice;

  IssuingPvViewModel(
      {this.offices,
      this.invoice,
      this.createInvoice,
      this.navigateToIssuingStepTwoAction,
      this.updateIssuingOffice,
      this.updateReceivingOffice});

  static IssuingPvViewModel fromStore(Store<AppState> store) {
    return IssuingPvViewModel(
        offices: store.state.officeState.offices,
        invoice: InvoiceModel.fromState(store.state.invoiceState),
        createInvoice:
            () {
          store.dispatch(new PostInvoiceActionPv(
              store.state.invoiceState.electionId, store.state.invoiceState.issuedToId, store.state.invoiceState.issuingOfficeId, store.state.invoiceState.receivingOfficeId));
        },
        navigateToIssuingStepTwoAction: () =>
            store.dispatch(new NavigateToIssuingPvStepTwoAction()),
        updateIssuingOffice: (issuingOfficeId) => store.dispatch(new UpdateIssuingOffice(issuingOfficeId)),
        updateReceivingOffice: (receivingOfficeId) => store.dispatch(new UpdateReceivingOffice(receivingOfficeId))
        );
  }
}
