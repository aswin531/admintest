import 'dart:io';
import 'package:admin_rent/utils/custom_error_text.dart';
import 'package:admin_rent/utils/custom_message_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StorageProvider with ChangeNotifier {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadFile(
    File image,
    String path,
    BuildContext context, {
    Function(double)? onUploadProgress,
  }) async {
    try {
      Reference reference = firebaseStorage.ref().child(path);
      UploadTask uploadTask = reference.putFile(image);
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        if (onUploadProgress != null) {
          double progress =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          onUploadProgress(progress);
        }
      });
      TaskSnapshot taskSnapshot = await uploadTask;
      final downloadUrl = await taskSnapshot.ref.getDownloadURL();
      if (kDebugMode) {
        print("url================{$downloadUrl}");
      }
      return downloadUrl;
    } catch (e) {
      if (kDebugMode) {
        print("Error uploading file: $e");
      }
      if (e is FirebaseException) {
        throw UserFriendlyException(message: getErrorMessage(e.code));
      } else {
        throw const UserFriendlyException(
            message: 'An unexpected error occurred during upload.');
      }
    }
  }

  //custom exception function
  void handleError(BuildContext context, Exception e) {
    if (e is UserFriendlyException) {
      MessageService.showSnackBar(context, e.message);
    } else {
      MessageService.showErrorDialog(
          context, 'Error', 'An unexpected error occurred.');
    }
  }
}














//when calling 
/*onPressed: () async {
  String downloadUrl = await uploadFile(file, path, context);
  // Use the downloadUrl if upload is successful
},
*/
