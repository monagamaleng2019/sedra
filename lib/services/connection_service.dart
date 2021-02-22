import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';

class ConnectionService extends ChangeNotifier {
  Future<bool> checkConnection() async {
    var connectionResult = await Connectivity().checkConnectivity();

    return connectionResult == ConnectivityResult.mobile ||
        connectionResult == ConnectivityResult.wifi;
  }

  ConnectionService() {
    Connectivity().checkConnectivity().then((connectionState) {
      _isConnected = connectionState == ConnectivityResult.mobile ||
          connectionState == ConnectivityResult.wifi;
    });
    _streamSubscription =
        Connectivity().onConnectivityChanged.listen((connectionState) {
      _isConnected = connectionState == ConnectivityResult.mobile ||
          connectionState == ConnectivityResult.wifi;
    });
    notifyListeners();
  }
  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  StreamSubscription<ConnectivityResult> _streamSubscription;
  bool _isConnected = false;
  bool get isConnected => _isConnected;
}
