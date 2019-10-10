import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/invoice_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/area_model.dart';
import 'package:tabulation/store/models/invoice_response.dart';

class ReceivingPvViewModel {
  final List<Area> areas;
  final InvoiceModel invoice;

  final Function() createInvoice;
  final Function navigateToReceivingStepTwoAction;
  final Function(int issuingOfficeId) updateIssuingOffice;
  final Function(int receivingOfficeId) updateReceivingOffice;
  final Function(int issuingDistrictId) updateIssuingDistrictId;
  final Function(int receivignDistrictId) updateReceivingDistrictId;

  ReceivingPvViewModel(
      {this.areas,
      this.invoice,
      this.createInvoice,
      this.navigateToReceivingStepTwoAction,
      this.updateIssuingOffice,
      this.updateReceivingOffice,
      this.updateIssuingDistrictId,
      this.updateReceivingDistrictId});

  static ReceivingPvViewModel fromStore(Store<AppState> store) {
    return ReceivingPvViewModel(
        areas: store.state.officeState.areas,
        invoice: InvoiceModel.fromState(store.state.invoiceState),
        createInvoice: () {
          store.dispatch(new PostInvoiceActionPvR(
              store.state.invoiceState.electionId,
              store.state.invoiceState.issuedToId,
              store.state.invoiceState.issuingOfficeId,
              store.state.invoiceState.receivingOfficeId));
        },
        navigateToReceivingStepTwoAction: () =>
            store.dispatch(new NavigateToReceivingPvStepTwoAction()),
        updateIssuingOffice: (issuingOfficeId) =>
            store.dispatch(new UpdateIssuingOffice(issuingOfficeId)),
        updateReceivingOffice: (receivingOfficeId) =>
            store.dispatch(new UpdateReceivingOffice(receivingOfficeId)),
        updateIssuingDistrictId: (id) =>
            store.dispatch(new UpdateIssuingDistrictId(id)),
        updateReceivingDistrictId: (id) =>
            store.dispatch(new UpdateReceivingDistrictId(id)));
  }
}
