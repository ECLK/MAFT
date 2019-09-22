import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/office_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/office_request.dart';

class HomeViewModel {
  final List<Office> elections;
  final Function(Office election) updateElection;
  final Office selectedElection;

  HomeViewModel({this.elections, this.updateElection, this.selectedElection});

  static HomeViewModel fromStore(Store<AppState> store) {
    return HomeViewModel(
        updateElection: (election) {
          store.dispatch(new UpdateElectionAction(election));
        },
        elections: store.state.officeState.elections,
        selectedElection: store.state.officeState.selectedElection);
  }
}
