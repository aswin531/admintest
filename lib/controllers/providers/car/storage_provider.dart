import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class StorageProvider with ChangeNotifier {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadFile(File file, String path, BuildContext context,
      {Function(int progress)? onUploadProgress}) async {
    try {
      basename(file.path);
      Reference storageReference = firebaseStorage.ref().child(path);
      UploadTask uploadTask = storageReference.putFile(file);

      if (onUploadProgress != null) {
        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          int progress = ((snapshot.bytesTransferred / snapshot.totalBytes) * 100).toInt();
          onUploadProgress(progress);
        });
      }

      await uploadTask.whenComplete(() {});
      String fileUrl = await storageReference.getDownloadURL();
      return fileUrl;
    } catch (e) {
      if (kDebugMode) {
        print('File upload error: $e');
      }
      rethrow;
    }
  }
}
