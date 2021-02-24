import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sedra/repositories/remote_repository.dart';
import 'package:sedra/services/connection_service.dart';
import 'package:sedra/services/message_service.dart';
import 'package:sedra/shared_widgets/button.dart';
import 'rate_view_model.dart';

void showRateDialoge() {
  showDialog(
    context: Get.context,
    barrierDismissible: false,
    builder: (context) {
      return ChangeNotifierProvider<RateViewModel>(
        create: (_) => RateViewModel(
          messageService: context.read<MessageService>(),
          connectionService: context.read<ConnectionService>(),
          remoteRepository: context.read<RemoteRepository>(),
        ),
        child: AlertDialog(content: _RateDialogeBody()),
      );
    },
  );
}

class _RateDialogeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var vm = context.watch<RateViewModel>();
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
              children: [Icon(Icons.star), Text("Rate App ")],
            ),
            IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.close),
            ),
          ],
        ),
        SizedBox(height: 8),
        RatingBar(
          onRatingUpdate: vm.onRatingUpdate,
          itemCount: 5,
          direction: Axis.horizontal,
          initialRating: 0.0,
          allowHalfRating: true,
          ratingWidget: RatingWidget(
            empty: Icon(Icons.star_border_outlined),
            half: Icon(Icons.star),
            full: Icon(Icons.star),
          ),
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
            onPressed: vm.onRateSubmitted,
          ),
        ),
      ],
    );
  }
}
