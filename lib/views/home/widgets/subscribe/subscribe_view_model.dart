import 'package:flutter/foundation.dart';
import 'package:sedra/repositories/remote_repository.dart';
import 'package:sedra/services/connection_service.dart';
import 'package:sedra/services/message_service.dart';
import 'package:sedra/views/base/base_view_model.dart';

class SubscribeToNotificationViewModel extends BaseViewModel {
  final ConnectionService connectionService;
  final RemoteRepository remoteRepository;
  final MessageService messageService;

  SubscribeToNotificationViewModel({
    @required this.connectionService,
    @required this.remoteRepository,
    @required this.messageService,
  }) : super(connectionService: connectionService);

  String _email;
  bool _isValidEmail = true;
  bool get isValidEmail => !_isValidEmail;

  void onEmailChanged(String email) {
    this._email = email;
  }

  void subscribeToNotificationAction() async {
    if (!isConnected) {
      messageService.showErrorMessage(
          title: "No Connection", body: "Connect to network then try again");
      return;
    }
    if (isLoading) return;
    if (!_isValidUserInput()) return;
    loadingState = true;
    var result =
        await remoteRepository.subscribeToNotification(userEmail: _email);
    loadingState = false;
    //TODO ask if u need to show dialoge or not for successful rating
  }

  bool _isValidUserInput() {
    bool isValid = _email != null &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(_email);
    _isValidEmail = isValid;
    notifyListeners();
    return isValid;
  }
}
