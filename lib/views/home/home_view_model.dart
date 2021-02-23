import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sedra/repositories/remote_repository.dart';
import 'package:sedra/routes/routes_names.dart';
import 'package:sedra/services/connection_service.dart';
import 'package:sedra/views/base/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  final ConnectionService connectionService;
  final RemoteRepository remoteRepository;
  HomeViewModel(
      {@required this.connectionService, @required this.remoteRepository})
      : super(connectionService: connectionService);

  void navigatetToContactUsAction() => Get.toNamed(contactUs);
  void navigatetToAboutCompanyAction() => Get.toNamed(aboutCompany);
  void navigatetToLastNewsAction() => Get.toNamed(lastNews);
  void rateAction() {}
  void subscribeToNotificationAction() {}
  void openhargeControlAction() {}
}
