//SHA1: 59:E1:7D:02:39:1B:ED:32:2D:59:2D:DA:9A:EB:2C:8A:F5:B9:48:42

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _onBackgroundHandler(RemoteMessage message) async {
    // print("_onBackgroundHandler ${message.messageId}");
    print(message.data);
    _messageStream.add(message.data['producto'] ?? 'No title');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    // print("_onMessageHandler ${message.messageId}");
    print(message.data);
    _messageStream.add(message.data['producto'] ?? 'No title');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    // print("_onMessageOpenApp ${message.messageId}");
    print(message.data);
    _messageStream.add(message.data['producto'] ?? 'No title');
  }

  static Future initializeApp() async {
    //Push notificacions
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);
    //Handlers
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
    //Local notificacions
  }

  static closeStream() {
    _messageStream.close();
  }
}
