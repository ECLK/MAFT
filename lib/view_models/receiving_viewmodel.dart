import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/invoice_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/area_model.dart';
import 'package:tabulation/store/models/invoice_response.dart';

class ReceivingViewModel {
  final List<Area> areas;
  final InvoiceModel invoice;
  final Function() createInvoice;
  final Function navigateToReceivingStepTwoAction;
  final Function(int issuingOfficeId) updateIssuingOffice;
  final Function(int receivingOfficeId) updateReceivingOffice;

  ReceivingViewModel(
      {this.areas,
      this.invoice,
      this.createInvoice,
      this.navigateToReceivingStepTwoAction,
      this.updateIssuingOffice,
      this.updateReceivingOffice});

  static ReceivingViewModel fromStore(Store<AppState> store) {
    return ReceivingViewModel(
        areas: store.state.officeState.areas,
        invoice: InvoiceModel.fromState(store.state.invoiceState),
        createInvoice: () {
          store.dispatch(new PostInvoiceReceivingAction(
              store.state.officeState.selectedSubElection.electionId,
              store.state.invoiceState.issuedToId,
              store.state.invoiceState.issuingOfficeId,
              store.state.invoiceState.receivingOfficeId));
        },
        navigateToReceivingStepTwoAction: () =>
            store.dispatch(new NavigateToReceivingStepTwoAction()),
        updateIssuingOffice: (issuingOfficeId) =>
            store.dispatch(new UpdateIssuingOffice(issuingOfficeId)),
        updateReceivingOffice: (receivingOfficeId) =>
            store.dispatch(new UpdateReceivingOffice(receivingOfficeId)));
  }
}
