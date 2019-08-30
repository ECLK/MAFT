import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/office_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/office_request.dart';

class HomeViewModel{
  
  final List<Office> offices;
  final Function() getOfficeAll;

  HomeViewModel({this.offices,this.getOfficeAll});

  static HomeViewModel fromStore(Store<AppState> store) {
    return HomeViewModel(
      offices: store.state.officeState.offices,
      getOfficeAll: () {
        store.dispatch(new FetchOficeAllAction());
      },
    );
  
  }
}