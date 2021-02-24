import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sedra/repositories/remote_repository.dart';
import 'package:sedra/services/connection_service.dart';
import 'package:sedra/services/message_service.dart';
import 'package:sedra/shared_widgets/button.dart';
import 'package:sedra/views/home/widgets/subscribe/subscribe_view_model.dart';

void showSubscribeDialoge() {
  showDialog(
    context: Get.context,
    barrierDismissible: false,
    builder: (context) {
      return ChangeNotifierProvider<SubscribeToNotificationViewModel>(
        create: (_) => SubscribeToNotificationViewModel(
          messageService: context.read<MessageService>(),
          connectionService: context.read<ConnectionService>(),
          remoteRepository: context.read<RemoteRepository>(),
        ),
        child: AlertDialog(content: _SbscribeToNotificationDialogeBody()),
      );
    },
  );
}

class _SbscribeToNotificationDialogeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var vm = context.watch<SubscribeToNotificationViewModel>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.notifications), Text("Subscribe")],
            ),
            IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.close),
            ),
          ],
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(hintText: "email"),
          onChanged: vm.onEmailChanged,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 8),
        Visibility(
          visible: vm.isValidEmail,
          child: Text("Enter availd email",
              style: TextStyle(color: Colors.red, fontSize: 12)),
        ),
        Visibility(
          visible: vm.isLoading,
          child: CircularProgressIndicator(),
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.bottomRight,
          child: Button(
            backgroundColor: Colors.black,
            label: "submit",
            onPressed: vm.subscribeToNotificationAction,
          ),
        ),
      ],
    );
  }
}
