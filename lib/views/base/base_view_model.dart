import 'package:flutter/widgets.dart';
import 'package:sedra/services/connection_service.dart';

class BaseViewModel extends ChangeNotifier {
  final ConnectionService connectionService;
  BaseViewModel({this.connectionService});

  bool get isConnected => connectionService.isConnected;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set loadingState(bool loadingState) {
    _isLoading = loadingState;
    notifyListeners();
  }

  // void inialLoadingState() {
  //   _isLoading = true;
  //   notifyListeners();
  // }
}
