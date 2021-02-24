import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sedra/services/connection_service.dart';
import 'package:sedra/services/message_service.dart';
import 'package:sedra/services/request_service.dart';

import 'repositories/remote_repository.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ConnectionService>(
    create: (_) => ConnectionService(),
  ),
  Provider<RequestService>(
    create: (_) => RequestService(),
  ),
   Provider<MessageService>(
    create: (_) => MessageService(),
  ),
  ProxyProvider<RequestService, RemoteRepository>(
    create: (_) => RemoteRepository(RequestService()),
    update: (_, __, ____) => RemoteRepository(RequestService()),
  ),
];
