import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:posts_app/product/global/bloc/global_bloc.dart';

class ConnectivityService {
  ConnectivityService(this._globalBloc);
  late StreamSubscription<ConnectivityResult> _subscription;

  final GlobalBloc _globalBloc;

  void startListening() {
    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        _globalBloc.add(const GlobalConnectionSuccessEvent());
      } else {
        _globalBloc.add(const GlobalNoConnectionEvent());
      }
    });
  }

  void stopListening() {
    _subscription.cancel();
  }
}
