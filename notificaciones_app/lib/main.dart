import 'package:flutter/material.dart';
import 'package:notificaciones_app/screens/home_screen.dart';
import 'package:notificaciones_app/screens/message_screen.dart';
import 'package:notificaciones_app/services/push_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messangerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    PushNotificationService.messagesStream.listen((message) {
      print('MyApp: ${message}');
      navigatorKey.currentState?.pushNamed('message', arguments: message);
      final snackBar = SnackBar(content: Text(message));
      messangerKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messangerKey,
      routes: {
        'home': (_) => HomeScreen(),
        'message': (_) => MessageScreen(),
      },
    );
  }
}
