import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/office_actions.dart';
import 'package:tabulation/store/app/app_state.dart';

class HomeViewModel {
  final Function() getOfficeAll;

  HomeViewModel({
    this.getOfficeAll,
  });

  static HomeViewModel fromStore(Store<AppState> store) {
    return HomeViewModel(
      getOfficeAll: () {
        store.dispatch(new FetchOficeAllAction());
      },
    );
  }
}
