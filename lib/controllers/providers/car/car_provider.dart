// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:admin_rent/controllers/providers/car/storage_provider.dart';
import 'package:admin_rent/model/car_model.dart';
import 'package:admin_rent/utils/custom_error_text.dart';
import 'package:admin_rent/utils/custom_message_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarProvider with ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  File? mainImage;
  List<File> images = [];

//state of image managing
  void setMainImage(File image) {
    mainImage = image;
    notifyListeners();
  }

//state of multiple image
  void setImages(List<File> imageList) {
    images = imageList;
    notifyListeners();
  }

  Future<void> addCarVehicle({
    required BuildContext context,
    required String make,
    required String engine,
    required int seatCapacity,
    required String model,
    required String body,
    required int year,
    required String color,
    required double rentalPriceDay,
    required bool status,
    required File mainImage,
    required List<File> images,
  }) async {
    try {
      StorageProvider storageProvider =
          Provider.of<StorageProvider>(context, listen: false);
      // Upload main image
      String mainImageUrl = await storageProvider.uploadFile(
        mainImage,
        'cars/${DateTime.now().millisecondsSinceEpoch}',
        context,
        onUploadProgress: (progress) {
          const CircularProgressIndicator();
          print('Main image upload progress: $progress%');
        },
      );
      // Upload additional images
      final List<String> imageUrls = [];
      for (File image in images) {
        final imageUrl = await storageProvider.uploadFile(
          image,
          'cars/${DateTime.now().millisecondsSinceEpoch}',
          context,
          onUploadProgress: (progress) {
            const CircularProgressIndicator();
            print('Main image upload progress: $progress%');
          },
        );
        imageUrls.add(imageUrl);
      }
      // Create car object
      CarVehicle carVehicle = CarVehicle(
          carId: "",
          make: make,
          engine: engine,
          seatCapacity: seatCapacity,
          model: model,
          body: body,
          year: year,
          color: color,
          rentalPriceDay: rentalPriceDay,
          status: status,
          imageUrls: imageUrls,
          mainImageUrl: mainImageUrl);

      // Save car details to Firestore
      final carMap = carVehicle.toFireStoreDocument();
      await firebaseFirestore.collection('cars').doc().set(carMap);
      setMainImage(File(''));
      setImages([]);
      notifyListeners();
      MessageService.showSnackBar(context, 'Car details added successfully!');
    } catch (e) {
      if (e is Exception) {
        handleError(context, e);
      } else {}
    }
  }

//Retrieve
  Future<List<CarVehicle>> getCars(String carId) async {
    try {
      QuerySnapshot snapshot = await firebaseFirestore.collection('cars').get();
      return snapshot.docs
          .map((doc) => CarVehicle.fromFirestoreDcument(
              doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    } catch (e) {
      print(e.toString());

      throw UserFriendlyException(
          message: 'Failed to fetch cars: ${e.toString()}');
    }
  }

  //Update CAR
  Future<void> updateCarVehicle({
    required BuildContext context,
    required String carId,
    required String make,
    required String engine,
    required int seatCapacity,
    required String model,
    required String body,
    required int year,
    required String color,
    required double rentalPriceDay,
    required bool status,
    File? mainImage,
    List<File>? images,
  }) async {
    try {
      StorageProvider storageProvider = Provider.of(context, listen: false);
      String? mainImageUrl;
      // ignore: unnecessary_null_comparison
      if (mainImageUrl != null) {
        mainImageUrl = await storageProvider.uploadFile(mainImage!,
            'cars/${DateTime.now().millisecondsSinceEpoch}', context);
      }
      final List<String> imageUrls = [];
      if (images != null) {
        for (File image in images) {
          final imageUrl = await storageProvider.uploadFile(
              image, 'cars/${DateTime.now().millisecondsSinceEpoch}', context);
          imageUrls.add(imageUrl);
        }
      }
      CarVehicle updatedCarVehicle = CarVehicle(
        carId: carId,
        make: make,
        engine: engine,
        seatCapacity: seatCapacity,
        model: model,
        body: body,
        year: year,
        color: color,
        rentalPriceDay: rentalPriceDay,
        status: status,
        imageUrls: imageUrls,
        mainImageUrl: mainImageUrl ?? '',
      );

      await firebaseFirestore
          .collection('cars')
          .doc(carId)
          .update(updatedCarVehicle.toFireStoreDocument());
      setMainImage(File(''));
      setImages([]);
      notifyListeners();
      MessageService.showSnackBar(context, 'Car details updated successfully!');
    } catch (e) {
      if (e is Exception) {
        handleError(context, e);
      } else {}
    }
  }

  //Delete
  Future<void> deleteCarVehicle(
      {required BuildContext context, required String carId}) async {
    try {
      await firebaseFirestore.collection('cars').doc(carId).delete();
      notifyListeners();
      MessageService.showSnackBar(context, 'Car details deleted successfully!');
    } catch (e) {
      if (e is Exception) {
        handleError(context, e);
      } else {}
    }
  }

  //retrieve BY ID
    Future<CarVehicle?> getCarById(String carId) async {
    try {
      DocumentSnapshot snapshot =
          await firebaseFirestore.collection('cars').doc(carId).get();
      if (snapshot.exists) {
        return CarVehicle.fromFirestoreDcument(
            snapshot.data() as Map<String, dynamic>, snapshot.id);
      } else {
        return null; // Car not found
      }
    } catch (e) {
      print(e.toString());
      throw UserFriendlyException(
          message: 'Failed to fetch car details: ${e.toString()}');
    }
  }


  void handleError(BuildContext context, Exception e) {
    if (e is UserFriendlyException) {
      MessageService.showSnackBar(context, e.message);
    } else {
      MessageService.showErrorDialog(
          context, 'Error', 'An unexpected error occurred.');
    }
  }
}
