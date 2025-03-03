import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:locume/Theme/theme.dart';
import 'package:locume/api/auth_provider.dart';
import 'package:locume/firebase_options.dart';
import 'app/routes/app_pages.dart';

// Initialize the notification plugin
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// Handle background notifications
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> setupFlutterNotifications() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Request notification permissions for iOS & Android 13+
  if (Platform.isIOS || Platform.isAndroid) {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      print('Notification permission denied');
      return;
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.notDetermined) {
      print('Notification permission not determined');
      return;
    }
  }

  // Initialize notification settings
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: selectNotification,
  );

  // Create a notification channel (Android 8.0+)
  if (Platform.isAndroid) {
    const AndroidNotificationChannel normalChannel = AndroidNotificationChannel(
      'notification',
      'Locum Notifications',
      description: 'This channel is used for locum notifications.',
      importance: Importance.max,
      playSound: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(normalChannel);
  }

  // Handle foreground messages (Show notification like background)
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Foreground notification received: \${message.notification?.title}");

    if (message.notification != null) {
      showLocalNotification(message);
    }
  });
}

Future<void> showLocalNotification(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  if (notification != null && android != null) {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'notification',
      'Locum Notifications',
      channelDescription: 'This channel is used for locum notifications.',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      platformChannelSpecifics,
      payload: message.data.toString(),
    );
  }
}

Future<void> selectNotification(
    NotificationResponse notificationResponse) async {
  print("STOP");

  if (notificationResponse.payload != null) {
    print('Notification payload: \${notificationResponse.payload}');
  }
}

Future<void> initService() async {
  String? token = await FirebaseMessaging.instance.getToken();
  print('Device Token: \$token');

  await Get.putAsync<AuthProvider>(() async => AuthProvider());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupFlutterNotifications();
  await initService();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Locume',
      theme: themeData(context),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
