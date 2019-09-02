import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:tabulation/routes.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/keys.dart';
import 'package:tabulation/store/store.dart';

void main() async {
  var store = await createStore();
  runApp(new TabulationApp(store));
}

class TabulationApp extends StatefulWidget {
  final Store<AppState> store;

  TabulationApp(this.store);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<TabulationApp> {
  // This widget is the root of results tabulation application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: widget.store,
      child: new MaterialApp(
        title: 'Results Tabulation',
        navigatorKey: Keys.navKey,
        routes: routes,
      ),
    );
  }
}
