import 'package:redux/redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/subelection_model.dart';

class HomeViewModel {
  final SubElection selectedSubElection;

  HomeViewModel({this.selectedSubElection});

  static HomeViewModel fromStore(Store<AppState> store) {
    return HomeViewModel(
        selectedSubElection: store.state.officeState.selectedSubElection);
  }
}
