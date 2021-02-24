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

  void subscribeToNotificationDialoge({
    @required void Function(String) onChanged,
    @required bool isValidEmail,
    @required VoidCallback onSubscribeSubmitted,
  }) {
    var emailEditText = TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
    );

    Get.defaultDialog(
      title: "Rate our app",
      cancel: Icon(Icons.close),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          emailEditText,
          Visibility(
            visible: isValidEmail,
            child: Text(
              "Enter avalid email",
              style: TextStyle(
                color: Colors.red,
                fontSize: 12.0,
              ),
            ),
          ),
          Button(
            backgroundColor: Colors.black,
            label: "submit",
            onPressed: onSubscribeSubmitted,
          ),
        ],
      ),
    );
  }
}
