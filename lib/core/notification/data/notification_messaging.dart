import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:googleapis/fcm/v1.dart' as googleapis;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/notification/entites/my_notification.dart';
import 'package:http/http.dart' as http;

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await NotificationMessaging.setupFlutterNotifications();
  print('Handling a background message ${message.messageId}');
}

class NotificationMessaging {
  NotificationMessaging._();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static late AndroidNotificationChannel _channel;

  static bool _isFlutterLocalNotificationsInitialized = false;

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // initialize firebase messaging
  static initialize() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    _initializeLocalNotifications();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(onMessageOpenedApp);
    FirebaseMessaging.onMessage.listen(onMessage);
  }

  static Future<void> _initializeLocalNotifications() async {
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings(
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentBanner: true,
      defaultPresentSound: true,
    );
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse:
          _onDidReceiveBackgroundNotificationResponse,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );
  }

  static _onDidReceiveBackgroundNotificationResponse(details) {
    print('onDidReceiveBackgroundNotificationResponse');
  }

  static _onDidReceiveNotificationResponse(details) {
    print('onDidReceiveNotificationResponse');
  }

  static onMessageOpenedApp(RemoteMessage message) {
    print("OnMessageOpenedApp: ${message.toString()}");
  }

  static onMessage(RemoteMessage message) {
    print("OnMessage: ${message.toString()}");
    showFlutterNotification(message);
  }

  static Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) {
      return;
    }
    _channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _isFlutterLocalNotificationsInitialized = true;
  }

  // show notification
  static void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    MyNotification myNotification = MyNotification(
      title: message.notification?.title ?? '',
      message: message.notification?.body ?? '',
      timestamp: Timestamp.now().toDate(),
      data: NotificationData.fromMap(message.data),
    );
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'Show high importance notifications',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        myNotification.data.notificationId.hashCode,
        myNotification.title,
        myNotification.message,
        platformChannelSpecifics,
      );
    }
  }

  // get token
  static Future<String> getToken() async {
    return await FirebaseMessaging.instance.getToken() ?? "Failed to get token";
  }

  // send notification
  static Future<void> sendNotification(MyNotification myNotification) async {
    final accessToken = await _getAccessToken();
    final projectId = 'halla-ca';
    final url =
        'https://fcm.googleapis.com/v1/projects/$projectId/messages:send';
    final receiverDoc = await _firestore
        .collection(AppConstants.userCollection)
        .doc(myNotification.data.receiverId)
        .get();

    Map<String, dynamic> fcmTokenMap = receiverDoc.data()?['fcmToken'] ?? {};

    for (var value in fcmTokenMap.values) {
      final payload = {
        'message': {
          'token': value,
          'notification': {
            'title': myNotification.title,
            'body': myNotification.message,
          },
          'data': myNotification.data.toMapWithoutContactsId(),
        },
      };
      // Send the notification
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to send notification: ${response.body}');
      }
      print('Notification sent successfully');
    }
  }

  // Generate OAuth 2.0 access token using the provided service account credentials
  static Future<String> _getAccessToken() async {
    final serviceAccount = auth.ServiceAccountCredentials.fromJson({
      "type": "service_account",
      "project_id": "halla-ca",
      "private_key_id": "1e05b453f0ac5e9fadf9e1de6c3e750dd4975c9c",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDWkZkShAsUkX3z\nJ2I0vjG4Amc7RLb6ajGbaOxBxCsdfZqxxjM6IlOLbnQKAJeQbJeiDlBu3tcofdEb\ncDXUlGYsEaSkwGDsiFtQ9VF9BhN9ITLtDEK4iutMJG9XNmSGxtgqRUyMkKHgy8BB\nGHLAKg/9+KbqrWOKlKQKjRweFfSiAnkNYUz1AxT16i+YsclPghQpQhpdl8IOlTgN\niIQfjkZTnZdPYBlTVA71V29vVZi5eBu6vqsTBvkTrO6evretxzaggE3sj3yZ6NAH\nzHucJduLqxXRsAbAtYx3tCb2yIJPuco69X1p27ZUuZW+hqi6+GS5XiCNcW1IZHH6\nW8Y7voEXAgMBAAECggEAHCTYhfgMN1mcF8w3J+w4kPETwaTni/ITlABlA31WcGr8\nuEu4hWwM4Zw5G+TBpz/Eezeob4UgMJ9MJxlb84hhhxnrVXF8ZRoU7DS5SGOxzmG6\nkHg2ujD9Na1jw0s5pVSonubHEyWXbhPGTGOHYv2Wv70hMQ/8H1MULzlyEjTWs8x5\n9+gN7uaVuASfbjjXjnC4KHRjBFaTY+P7pnE4Hiy17l7NrWI09Ir5u/GD2q26g9CX\nMo6xrr0rOicEpy2kB1LIAmubYKIqOTg2J6L9gQ9ebdj0oFwz5xo7LGqzxmvciXLm\npxSAHGJrtpaoYiiJOW5fRhVAoNaUhPnws8V5jIYYLQKBgQD5X9vH0x8/snLSIN/S\nADj5hwu6n+yFlNyohHTtOGAB6oK3Jjpz1as7wwhnPU6/J8psUZGIt/1ZhYPO31km\nELX6yar5biHDiMQnkZQ8X9ONeTz/hLGxMw3OWx9xO9rJ+5p84tazOrVJ9HzzxJFu\nQ8fujdR3edURocC5AB4FN0n/mwKBgQDcRQFl0HgNlzglqydtrLgkuqVpiDRsmiQa\nRCScwM70szec02/HySzt0B6GdwBbXK98j5JkM+j/3xjqCYg1IW7xmYvNci/944BP\n29eTGgIKkpCjc7LY3gZCJmRzET0tHUcpHJBv7qOfn5B9uAkmdDQRovzGx7kqSGKA\noEdBIQ4iNQKBgEAvL/5KlKxsXak/1NvUOtXesGIkb1gibHjjPsUf0XYsyeAh8sGF\nqUEEfdE0smP49dzTUcYCtS6pcrd4PRXTD0OxTFROyFnvha05hxHTCDxNjCmoGaQm\nI9ONGJaodTOvkp+6MtCGt8qFJvQHD/d1cqwvzRPDQ9f57gSvxwpIpL8pAoGAPj7h\n3jvDMVQCceKkCcI9Z2O3StNKvUXx3dpT3lg+I7hhhtfZRsP7BllBxw3p8+eFT9Xi\nsJ5awbPx/nEjJKCGEZAqiawzE7QulmKx0MgQu5wfc5FGgTJ84kSnLj045H7ZlSyV\nRIxTgNA+rMhNDajY7gL5G9Nk6CX8cAzbFfSZYeECgYEAv8ryXmeqa9IHX+oZULbV\nPnFRDKXavh9Ioh5/vlVlwzMnEO5BtOru2UnrqeXpHx/twLoZ4jWTJ0yVY3hB15rm\nEbuUBodMRwAUlOpZPh8jQPQT433zNMNWFs6pRddXjokygcVt9LcCa0Am1bMVHFnE\nGf92NC38aWPbzLM5MrfkHg8=\n-----END PRIVATE KEY-----\n",
      "client_email":
          "halla-notification-16634@halla-ca.iam.gserviceaccount.com",
      "client_id": "114066892811040706375",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/halla-notification-16634%40halla-ca.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    });

    final scopes = [googleapis.FirebaseCloudMessagingApi.cloudPlatformScope];
    final client = http.Client();

    final accessToken = await auth.obtainAccessCredentialsViaServiceAccount(
      serviceAccount,
      scopes,
      client,
    );

    client.close();
    return accessToken.accessToken.data;
  }
}
