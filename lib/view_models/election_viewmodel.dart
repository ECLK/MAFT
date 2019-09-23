import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/auth_actions.dart';
import 'package:tabulation/store/actions/invoice_actions.dart';
import 'package:tabulation/store/actions/office_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/election_model.dart';
// import 'package:tabulation/store/models/office_request.dart';
import 'package:tabulation/store/models/subelection_model.dart';
// import 'package:tabulation/store/models/subelection_model.dart';

class ElectionViewModel {
  final List<Election> elections;
  final Function(SubElection subElection) navigateToHomeAction;
  final Function(Election election) navigateToSubElectionAction;
  final Election selectedElection;
  final SubElection selectedSubElection;

  ElectionViewModel({this.elections, this.selectedElection, this.navigateToHomeAction, this.selectedSubElection, this.navigateToSubElectionAction});

  static ElectionViewModel fromStore(Store<AppState> store) {
    return ElectionViewModel(
        navigateToHomeAction: (subElection) {
          store.dispatch(new NavigateToHomeAction(subElection));
        },
        navigateToSubElectionAction: (election) {
          store.dispatch(new NavigateToSubElectionAction(election));
        },        
        elections: store.state.officeState.elections,
        selectedElection: store.state.officeState.selectedElection,
        selectedSubElection: store.state.officeState.selectedSubElection);
  }
}
