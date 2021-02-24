import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sedra/shared_widgets/button.dart';

class MessageService {
  void showErrorMessage({@required String title, @required String body}) {
    Get.snackbar(
      title,
      body,
      colorText: Colors.red,
      backgroundColor: Colors.white,
    );
  }
}
