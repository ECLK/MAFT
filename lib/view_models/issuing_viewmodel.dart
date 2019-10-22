import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/invoice_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/area_model.dart';
import 'package:tabulation/store/models/invoice_response.dart';

class IssuingViewModel {
  final List<Area> areas;
  final InvoiceModel invoice;
  final Function() createInvoice;
  final Function navigateToIssuingStepTwoAction;
  final Function(int issuingOfficeId) updateIssuingOffice;
  final Function(int receivingOfficeId) updateReceivingOffice;
  final Function(int issuingDistrictId) updateIssuingDistrictId;
  final Function(int receivingDistrictId) updateReceivingDistrictId;
  final Function(int issuingPollingDivisionId) updateIssuingPollingDivisionId;
  final Function(int receivingPollingStationId) updateReceivingPollingStationId;
  final Function(int receivingPollingDivisionId)
      updateReceivingPollingDivisionId;
  IssuingViewModel(
      {this.areas,
      this.invoice,
      this.createInvoice,
      this.navigateToIssuingStepTwoAction,
      this.updateIssuingOffice,
      this.updateReceivingOffice,
      this.updateIssuingDistrictId,
      this.updateReceivingDistrictId,
      this.updateIssuingPollingDivisionId,
      this.updateReceivingPollingStationId,
      this.updateReceivingPollingDivisionId});

  static IssuingViewModel fromStore(Store<AppState> store) {
    return IssuingViewModel(
        areas: store.state.officeState.areas,
        invoice: InvoiceModel.fromState(store.state.invoiceState),
        createInvoice: () {
          store.dispatch(new PostInvoiceAction(
              store.state.officeState.selectedSubElection.electionId,
              store.state.invoiceState.issuedToId,
              store.state.invoiceState.issuingOfficeId,
              store.state.invoiceState.receivingOfficeId,
              store.state.invoiceState.issuingDistrictId,
              store.state.invoiceState.receivingDistrictId));
        },
        navigateToIssuingStepTwoAction: () =>
            store.dispatch(new NavigateToIssuingStepTwoAction()),
        updateIssuingOffice: (issuingOfficeId) =>
            store.dispatch(new UpdateIssuingOffice(issuingOfficeId)),
        updateReceivingOffice: (receivingOfficeId) =>
            store.dispatch(new UpdateReceivingOffice(receivingOfficeId)),
        updateIssuingDistrictId: (districtId) =>
            store.dispatch(new UpdateIssuingDistrictId(districtId)),
        updateReceivingDistrictId: (districtId) =>
            store.dispatch(new UpdateReceivingDistrictId(districtId)),
        updateIssuingPollingDivisionId: (id) =>
            store.dispatch(new UpdateIssuingPollingDivisionId(id)),
        updateReceivingPollingStationId: (id) =>
            store.dispatch(new UpdateReceivingPollingStationId(id)),
        updateReceivingPollingDivisionId: (id) =>
            store.dispatch(new UpdateReceivingPollingDivisionId(id)));
  }
}
