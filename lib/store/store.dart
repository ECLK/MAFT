import 'dart:async';
import 'package:redux/redux.dart';
import 'package:tabulation/store/app/app_reducer.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/middleware/api_middleware.dart';
import 'package:tabulation/store/middleware/navigation_middleware.dart';
import 'package:tabulation/store/middleware/validation_middleware.dart';

Future<Store<AppState>> createStore() async {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      ValidationMiddleware(),
      APIMiddleware(),
      NavigationMiddleware(),
    ],
  );
}