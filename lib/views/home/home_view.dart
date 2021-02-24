import 'package:flutter/material.dart';
import 'package:sedra/repositories/remote_repository.dart';
import 'package:sedra/services/connection_service.dart';
import 'package:sedra/services/message_service.dart';
import 'package:sedra/shared_widgets/logo.dart';
import 'package:provider/provider.dart';
import 'package:sedra/views/home/home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ChangeNotifierProvider(
          create: (_) => HomeViewModel(
            messageService: context.read<MessageService>(),
            remoteRepository: context.read<RemoteRepository>(),
            connectionService: context.read<ConnectionService>(),
          ),
          child: _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 12),
        Logo(),
        Expanded(child: SizedBox()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LabeledIcon(
                  icon: Icon(Icons.person_add),
                  label: "Contact Us",
                  onTap:
                      context.read<HomeViewModel>().navigatetToContactUsAction,
                ),
                SizedBox(height: 12),
                LabeledIcon(
                  onTap: context.read<HomeViewModel>().openhargeControlAction,
                  icon: Icon(Icons.battery_alert),
                  label: "Control\n Chanrger",
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LabeledIcon(
                  icon: Icon(Icons.info),
                  label: "About",
                  onTap: context
                      .read<HomeViewModel>()
                      .navigatetToAboutCompanyAction,
                ),
                SizedBox(height: 12),
                LabeledIcon(
                  onTap: context
                      .read<HomeViewModel>()
                      .subscribeToNotificationAction,
                  icon: Icon(Icons.notifications),
                  label: "Subscribe",
                ),
              ],
            ),
            Column(
              children: [
                LabeledIcon(
                  onTap:
                      context.read<HomeViewModel>().navigatetToLastNewsAction,
                  icon: Icon(Icons.person_add),
                  label: "Last News",
                ),
                SizedBox(height: 12),
                LabeledIcon(
                  icon: Icon(Icons.star),
                  label: "Rate",
                  onTap: context.read<HomeViewModel>().rateAction,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class LabeledIcon extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;
  LabeledIcon(
      {@required this.icon, @required this.label, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
