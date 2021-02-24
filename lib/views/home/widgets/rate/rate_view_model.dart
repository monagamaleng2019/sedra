import 'package:flutter/foundation.dart';
import 'package:sedra/repositories/remote_repository.dart';
import 'package:sedra/services/connection_service.dart';
import 'package:sedra/services/message_service.dart';
import 'package:sedra/views/base/base_view_model.dart';

class RateViewModel extends BaseViewModel {
  final ConnectionService connectionService;
  final RemoteRepository remoteRepository;
  final MessageService messageService;

  RateViewModel({
    @required this.connectionService,
    @required this.remoteRepository,
    @required this.messageService,
  }) : super(connectionService: connectionService);

  double currentRate = 0.0;
  void onRatingUpdate(double rate) {
    currentRate = rate;
  }

  void onRateSubmitted() async {
    if (!isConnected) {
      messageService.showErrorMessage(
          title: "No Connection", body: "Connect to network then try again");
      return;
    }
    if (isLoading) return;
    loadingState = true;
    var result = await remoteRepository.rateApp(rateValue: currentRate);
    loadingState = false;
    //TODO ask if u need to show dialoge or not for successful rating
  }
}
