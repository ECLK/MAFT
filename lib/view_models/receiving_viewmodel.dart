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
  final Function(int issuingDistrictId) updateIssuingDistrictId;
  final Function(int receivingDistrictId) updateReceivingDistrictId;
  final Function(int receivingPollingDivisionId)
      updateReceivingPollingDivisionId;
  final Function(int issuingPollingDivisionId) updateIssuingPollingDivisionId;
  final Function(int issuingPollingStationId) updateIssuingPollingStationId;

  ReceivingViewModel(
      {this.areas,
      this.invoice,
      this.createInvoice,
      this.navigateToReceivingStepTwoAction,
      this.updateIssuingOffice,
      this.updateReceivingOffice,
      this.updateIssuingDistrictId,
      this.updateReceivingDistrictId,
      this.updateReceivingPollingDivisionId,
      this.updateIssuingPollingDivisionId,
      this.updateIssuingPollingStationId});

  static ReceivingViewModel fromStore(Store<AppState> store) {
    return ReceivingViewModel(
        areas: store.state.officeState.areas,
        invoice: InvoiceModel.fromState(store.state.invoiceState),
        createInvoice: () {
          store.dispatch(new PostInvoiceReceivingAction(
              store.state.officeState.selectedSubElection.electionId,
              store.state.invoiceState.issuedToId,
              store.state.invoiceState.issuingOfficeId,
              store.state.invoiceState.receivingOfficeId,
              store.state.invoiceState.issuingDistrictId,
              store.state.invoiceState.receivingDistrictId));
        },
        navigateToReceivingStepTwoAction: () =>
            store.dispatch(new NavigateToReceivingStepTwoAction()),
        updateIssuingOffice: (issuingOfficeId) =>
            store.dispatch(new UpdateIssuingOffice(issuingOfficeId)),
        updateReceivingOffice: (receivingOfficeId) =>
            store.dispatch(new UpdateReceivingOffice(receivingOfficeId)),
        updateIssuingDistrictId: (districtId) =>
            store.dispatch(new UpdateIssuingDistrictId(districtId)),
        updateReceivingDistrictId: (districtId) =>
            store.dispatch(new UpdateReceivingDistrictId(districtId)),
        updateReceivingPollingDivisionId: (id) =>
            store.dispatch(new UpdateReceivingPollingDivisionId(id)),
        updateIssuingPollingDivisionId: (id) =>
            store.dispatch(new UpdateIssuingPollingDivisionId(id)),
            updateIssuingPollingStationId:(id)=>
            store.dispatch(new UpdateIssuingPollingStationId(id)));
  }
}
