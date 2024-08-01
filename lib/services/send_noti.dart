import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'dart:convert';

class PushNotificationServices {
  static Future<String> getAccesToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "rentit-11660",
      "private_key_id": "2cbca126a9e446b29e415fc06922c3c7fb259e9a",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC8CbtDoe2DRytE\npL1rfAx833J+hRPSAa+b+rdSClQM8a+INKatttqMW0G1jFMyFv7ifcA6XkZKj9Gy\nT/NthWSSqNuFfIYGK3rFiRmq2TWw/HMZccAZV3AgW2Rf7YB0v7D7nbyPsj/YVIFL\nQoH9W1PaeCYa0dq2xCQHG2KDJ2cwMcQbRcGzn6ngNcND+ZrJjZtaEtVdzkuwQpPH\nRP8ycN1hrGWxcbBNK9NxrB9RQYcv9rWQQMPRCvNH4EjpJ74wXJPPQaJ70ST8lC1T\nSCI0nC93onYU6aCnKaWdWEjfGMqrbJlwpfvzoXeQr0s4dfFNwRSo47Q/pwT5CKnk\n40XRHLuRAgMBAAECggEAD4VYHTWE9tSNiD122yPinf4No87VO3zjI2NW9WEf3e+n\nFv2NkoIo2PQBYPxjs5s9T7Gkh8zXTXlAjFDYHX6otghVElgcce7t09dEtJr4ORMl\nZwDCI/VZLnqMtvRSKZDXCXXUJiJG7dLP10f2ldSPf9VyA721qWdYN/P1NjEu7cXR\nkeuuZqI8g178jt8GmCzlkrpPleFdVrrvMYt23ebSvTqkx3JQEh9reGoNNaxGD/Mx\nbRVUTQI6ht1ST5LDpIhbVH3JoKIPCd5RmB7xZrnNCPTYQJ7QjnNkCwQApqz9cgFf\nipdKzwgn5TWWkVu9HDOiuWJyCfgojTHsjFAs6872NwKBgQDldMnlMMdVfr6+l1lH\nGI2/mYrkS+RLZPmllMZJV0SeNnA0KniGHO9xWW9sxQW3GQqsM9s0ebB1r/fE5OdO\nC2VJ1vKC9951pZw+pAf1WQhdFik/kfrqgjbi9LyaCwbprQI1mHd7Y52e509IoCGc\nZBTbNlTU1vrCAwcSI5v0gjx4jwKBgQDRyl4ILSh9YcvTlQ4MshacDEFRuHM7FwCf\nbVvWL1RxJAYT8gQkp5BtLSdA9Y3ovB5ZFstiIXMrIGwFbfJXzkSlkrLUWEJMuDnz\nicSoe+z96CPanA70XO9soLPtvMeZD7KOoI9bFxRv2FJF5Huu5wjdbLqswJ2RAWOK\n0wO6RhpZ3wKBgQC1S0p9+MV2apdBNYoHn4HX4fQYn1H4tAZ/6oWkyvvfWbnbrbbe\nmBwj3fso4J68ZV/GYY6P7poa0nccrZOIWX6lEd0416mAIOLLp4TWOItgKTNcE/ZB\ntbKyLZaay52hod2+BQJajoGqXK6K/mKwE29bKJlsNZOZGRVMIrCFRyWKRwKBgQCH\nplp23vw3Vmz9OnwDKYQFEseJl8Kqio0UiRnAvInVPn3Pl8WmDdMNRQ0Eq8I+oqTc\n5ihMI2TclfJC8Hyq2ez5QonvU8JK6TRPjN1kM/1hkCDe0dm5l/4YNzEgn9hP2B6U\nqq0HMT09tJo+JybySOEqi4uI+GLpyAQdV6QpZfrT8QKBgAkJTKSKG3he/KeCXdMk\n8sKV/aINuANACubUH5q795cvi+NNdjESy3Wk536CQ3TPFYX+DBwjxHlbBseXOAu/\n9X2RWmd4aN8kMknferFyxn8WaY/qXwiChoHACqgxGMPJAgohQ+peGxFnuKKth6ip\nmuRrcR+dnkQcF7k/kcF0ksb/\n-----END PRIVATE KEY-----\n",
      "client_email": "rentitflutter@rentit-11660.iam.gserviceaccount.com",
      "client_id": "112354009084340998014",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/rentitflutter%40rentit-11660.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.messaging",
      "https://www.googleapis.com/auth/firebase.messaging",
      "https://www.googleapis.com/auth/firebase.database"
    ];

    http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

    // Get the access token
    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
            scopes,
            client);
    client.close();

    return credentials.accessToken.data;
  }

  static Future<void> sendNotificationToUser(
      String deviceToken, BuildContext context, String requestId) async {
    final String serverAccessTokenKey =
        await getAccesToken(); // Getting FCM server Access Token
    String endpointFirebaseCloudMessaging =
        'https://fcm.googleapis.com/v1/projects/rentit-11660/messages:send'; // Token Assigned to this Endpoint

    final Map<String, dynamic> message = {
      'message': {
        'token': deviceToken,
        'notification': {
          'title': 'Car Rental Request',
          'body':
              'You have a rental request for the selected car on the selected date.'
        },
        'data': {
          'requestID': requestId,
        }
      }
    };

    // POST HTTP
    final http.Response response = await http.post(
      Uri.parse(endpointFirebaseCloudMessaging),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverAccessTokenKey'
      },
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      debugPrint("FCM Notification Sent Successfully");
    } else {
      debugPrint("Failed FCM Notification: ${response.statusCode}");
    }
  }

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<void> saveUserDeviceToken(String userId) async {
    String? token = await firebaseMessaging.getToken();
    if (token != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set({'fcmToken': token}, SetOptions(merge: true));
    }
  }

  Future<String?> getAdminDeviceToken(String adminId) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('admins')
        .doc(adminId)
        .get();
    if (doc.exists) {
      return doc['fcmToken'];
    }
    return null;
  }

  Future<void> updateAdminDeviceToken(String adminId) async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      await FirebaseFirestore.instance
          .collection('admins')
          .doc(adminId)
          .set({
        'fcmToken': token,
        'tokenLastUpdated': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    }
  }

}
