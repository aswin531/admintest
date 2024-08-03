// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationPlugin =
//       FlutterLocalNotificationsPlugin();
//   final user = FirebaseAuth.instance.currentUser;

//   /// Requests notification permissions from the user.
//   void requestNotificationPermission() async {
//     NotificationSettings settings = await firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       debugPrint('User Granted Permission');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       debugPrint('User Granted Provisional Permission');
//     } else {
//       debugPrint('User Denied Permission');
//     }
//   }

//   /// Initializes local notification settings for Android.
//   Future<void> initLocalNotification(
//       BuildContext context, RemoteMessage message) async {
//     var androidInitializationSettings =
//         const AndroidInitializationSettings('@mipmap/ic_launcher');

//     var initializationSetting = InitializationSettings(
//       android: androidInitializationSettings,
//     );

//     await flutterLocalNotificationPlugin.initialize(
//       initializationSetting,
//       onDidReceiveNotificationResponse: (NotificationResponse details) {
//         // Handle notification tap
//         // handleMessage(context, message);
//       },
//     );
//   }

//   /// Initializes Firebase Messaging to listen for incoming messages and handle token refresh.
//   void firebaseInit(BuildContext context) {
//     // Listen for token refresh events and update Firestore with the new token.
//     FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
//       updateDeviceToken(newToken);
//     });

//     // Handle initial message when the app is opened from a terminated state.
//     FirebaseMessaging.instance.getInitialMessage().then((message) {
//       if (message != null) {
//         // handleMessage(context, message);
//       }
//     });

//     // Handle message when the app is opened from the background.
//     FirebaseMessaging.onMessageOpenedApp.listen((message) {
//       // handleMessage(context, message);
//     });

//     // Handle message when the app is in the foreground.
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       debugPrint('Received a foreground message:');
//       debugPrint('Title: ${message.notification?.title}');
//       debugPrint('Body: ${message.notification?.body}');
//       debugPrint('Data: ${message.data}');
//       initLocalNotification(context, message);
//       showNotification(message);
//     });

//     // Handle background messages.
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//   }

//   /// Updates the device token in Firestore for the admin user.
//   Future<void> updateDeviceToken(String newToken) async {
//     if (user != null) {
//       await firestore.collection('deviceTokens').doc('Admin').set({
//         'token': newToken,
//       }, SetOptions(merge: true));
//     } else {
//       debugPrint('No user is signed in.');
//     }
//   }

//   /// Displays a notification using the Flutter Local Notifications plugin.
//   Future<void> showNotification(RemoteMessage message) async {
//     const String channelId = 'high_importance_channel';
//     const String channelName = 'High Importance Notifications';

//     AndroidNotificationChannel channel = const AndroidNotificationChannel(
//       channelId,
//       channelName,
//       importance: Importance.max,
//     );

//     await flutterLocalNotificationPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);

//     AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//       channel.id,
//       channel.name,
//       importance: Importance.high,
//       priority: Priority.high,
//       ticker: 'ticker',
//       icon: '@mipmap/ic_launcher',
//     );

//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//     );

//     try {
//       await flutterLocalNotificationPlugin.show(
//         0,
//         message.notification?.title ?? '',
//         message.notification?.body ?? '',
//         notificationDetails,
//       );
//     } catch (e) {
//       debugPrint('Error showing notification: $e');
//     }
//   }

//   /// Retrieves the device token and saves it to Firestore for the admin user.
//   Future<String> getDeviceToken() async {
//     String? token = await firebaseMessaging.getToken();
//     if (token != null) {
//       await firestore.collection('deviceTokens').doc('Admin').set({
//         'token': token,
//       });
//       return token;
//     } else {
//       debugPrint('Error: Token is null');
//       return '';
//     }
//   }

//   /// Listens for token refresh events and updates Firestore with the new token.
//   void isTokenRefresh() async {
//     firebaseMessaging.onTokenRefresh.listen(
//       (newToken) {
//         updateDeviceToken(newToken);
//       },
//     );
//   }

//   // /// Handles incoming messages and navigates to the appropriate screen based on message data.
//   // void handleMessage(BuildContext context, RemoteMessage message) {
//   //   if (message.data['type'] == 'msj') {
//   //     Navigator.push(
//   //         context,
//   //         MaterialPageRoute(
//   //           builder: (context) => const MainProfileScreen(),
//   //         ));
//   //   }
//   // }
// }

// /// Background message handler for Firebase Messaging.
// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   debugPrint("Handling a background message: ${message.messageId}");
//   debugPrint("Message data: ${message.data}");
//   debugPrint("Message notification: ${message.notification?.title}");
//   debugPrint("Message notification: ${message.notification?.body}");
// }
