// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';
import 'package:admin_rent/controllers/providers/car/carfilter_provider.dart';
import 'package:admin_rent/controllers/providers/car/storage_provider.dart';
import 'package:admin_rent/model/car_model.dart';
import 'package:admin_rent/utils/custom_error_text.dart';
import 'package:admin_rent/utils/custom_message_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarProvider with ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  File? mainImage;
  List<File> images = [];
  bool isLoading = false;
  String? selectedMake;
  String? selectedEngine;
  int? selectedYear;
  Color? selectedColor;
  String? model;
  String? body;
  bool isAvailable = false;
  int? seatCapacity;
  RangeValues rentalPriceRange = const RangeValues(500, 10000);

  TextEditingController modelController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController seatCapacityController = TextEditingController();

  void updateMake(String? make) {
    selectedMake = make;
    notifyListeners();
  }

  void updateEngine(String? engine) {
    selectedEngine = engine;
    notifyListeners();
  }

  void updateYear(int? year) {
    selectedYear = year;
    notifyListeners();
  }

  void updateColor(Color? color) {
    selectedColor = color;
    notifyListeners();
  }

  void updateModel(String? model) {
    this.model = model;
    modelController.text = model ?? '';
    notifyListeners();
  }

  void updateBody(String? body) {
    this.body = body;
    bodyController.text = body ?? '';
    notifyListeners();
  }

  void updateAvailability(bool status) {
    isAvailable = status;
    notifyListeners();
  }

  void updateSeatCapacity(int? seatCapacity) {
    this.seatCapacity = seatCapacity;
    seatCapacityController.text = seatCapacity?.toString() ?? '';
    notifyListeners();
  }

  void updaterentalPriceRange(RangeValues rentalPriceRange) {
    this.rentalPriceRange = rentalPriceRange;
    notifyListeners();
  }

  void setMainImage(File image) {
    mainImage = image;
    notifyListeners();
  }

  void setImages(List<File> imageList) {
    images = imageList;
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Stream<List<CarVehicle>> getCarVehiclesStream() async* {
    try {
      // final filterProvider =
      //   Provider.of<CarFilterChipProvider>(context, listen: false);
      //final selectedFilters = filterProvider.selectedFilters;

      await for (var snapshot
          in firebaseFirestore.collection('cars').snapshots()) {
        yield snapshot.docs.map((doc) {
          return CarVehicle.fromFirestoreDcument(doc.data(), doc.id);
        }).toList();
      }
    } catch (e) {
      debugPrint('Error fetching car vehicles: $e');
      // handleError(
      //     context as BuildContext, e as Exception);
    }
  }

  Future<List<String>> getUniqueValues(String field) async {
    final querySnapshot = await firebaseFirestore.collection('cars').get();
    final allValues = querySnapshot.docs
        .map((doc) {
          final value = doc[field];
          if (value != null) {
            return value.toString(); // Convert any value to a string
          } else {
            return '';
          }
        })
        .toSet()
        .toList();
    return allValues;
  }

  Future<void> updateCarVehicle(
    BuildContext context,
    String carId,
  ) async {
    setLoading(true);
    try {
      StorageProvider storageProvider = Provider.of(context, listen: false);

      String mainImageUrl = mainImage != null
          ? await storageProvider.uploadFile(
              mainImage!,
              'cars/${DateTime.now().millisecondsSinceEpoch}',
              context,
              onUploadProgress: (progress) {
                if (kDebugMode) {
                  print('Main image upload progress: $progress%');
                }
              },
            )
          : '';

      final List<String> imageUrls = [];
      for (File image in images) {
        final imageUrl = await storageProvider.uploadFile(
          image,
          'cars/${DateTime.now().millisecondsSinceEpoch}',
          context,
          onUploadProgress: (progress) {
            if (kDebugMode) {
              print('Additional image upload progress: $progress%');
            }
          },
        );
        imageUrls.add(imageUrl);
      }

      CarVehicle carVehicle = CarVehicle(
        carId: carId,
        make: selectedMake!,
        engine: selectedEngine!,
        seatCapacity: seatCapacity!,
        model: model!,
        body: body!,
        year: selectedYear!,
        color: selectedColor!.value.toRadixString(16),
        rentalPriceRange: rentalPriceRange,
        status: isAvailable,
        imageUrls: imageUrls,
        mainImageUrl: mainImageUrl,
      );

      final carMap = carVehicle.toFireStoreDocument();
      await firebaseFirestore.collection('cars').doc(carId).update(carMap);

      notifyListeners();
      MessageService.showSnackBar(context, 'Car details updated successfully!');
    } catch (e) {
      if (e is Exception) {
        handleError(context, e);
      }
    } finally {
      setLoading(false);
    }
  }

  Future<void> deleteCarVehicle(BuildContext context, String carId) async {
    setLoading(true);
    try {
      await firebaseFirestore.collection('cars').doc(carId).delete();
      notifyListeners();
      MessageService.showSnackBar(context, 'Car deleted successfully!');
    } catch (e) {
      if (e is Exception) {
        handleError(context, e);
      }
    } finally {
      setLoading(false);
    }
  }

  void resetForm() {
    selectedMake = null;
    selectedEngine = null;
    selectedYear = null;
    selectedColor = null;
    model = null;
    body = null;
    isAvailable = false;
    seatCapacity = null;
    rentalPriceRange = const RangeValues(500, 10000);
    mainImage = null;
    images = [];

    modelController.clear();
    bodyController.clear();
    seatCapacityController.clear();
  }

  @override
  void dispose() {
    modelController.dispose();
    bodyController.dispose();
    seatCapacityController.dispose();
    super.dispose();
  }

  void handleError(BuildContext context, Exception e) {
    if (e is UserFriendlyException) {
      MessageService.showSnackBar(context, e.message);
    } else {
      MessageService.showErrorDialog(
          context, 'Error', 'An unexpected error occurred.');
    }
  }

  Future<void> submitCarDetails(BuildContext context) async {
    if (kDebugMode) {
      print('submitCarDetails called');
    }

    if (selectedMake != null &&
        selectedEngine != null &&
        selectedYear != null &&
        selectedColor != null &&
        model != null &&
        body != null &&
        seatCapacity != null &&
        // ignore: unnecessary_null_comparison
        rentalPriceRange != null &&
        mainImage != null &&
        images.isNotEmpty) {
      setLoading(true);
      if (kDebugMode) {
        print('All fields are filled. Proceeding to add car details.');
      }

      try {
        await addCarVehicle(
          context: context,
          make: selectedMake!,
          engine: selectedEngine!,
          seatCapacity: seatCapacity!,
          model: model!,
          body: body!,
          year: selectedYear!,
          color: selectedColor!.value.toRadixString(16),
          rentalPriceRange: rentalPriceRange,
          status: isAvailable,
          mainImage: mainImage!,
          images: images,
        );
      } catch (e) {
        if (kDebugMode) {
          print('Error in submission: $e');
        }
        handleError(context, e as Exception);
      } finally {
        setLoading(false);
      }
    } else {
      if (kDebugMode) {
        print('Missing fields. Showing error dialog.');
      }
      MessageService.showErrorDialog(context, 'Error',
          'Please fill in all required fields and upload images.');
    }
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
    required RangeValues rentalPriceRange,
    required bool status,
    required File mainImage,
    required List<File> images,
  }) async {
    setLoading(true);
    try {
      StorageProvider storageProvider =
          Provider.of<StorageProvider>(context, listen: false);

      String mainImageUrl = await storageProvider.uploadFile(
        mainImage,
        'cars/${DateTime.now().millisecondsSinceEpoch}',
        context,
        onUploadProgress: (progress) {
          if (kDebugMode) {
            print('Main image upload progress: $progress%');
          }
        },
      );

      final List<String> imageUrls = [];
      for (File image in images) {
        final imageUrl = await storageProvider.uploadFile(
          image,
          'cars/${DateTime.now().millisecondsSinceEpoch}',
          context,
          onUploadProgress: (progress) {
            if (kDebugMode) {
              print('Additional image upload progress: $progress%');
            }
          },
        );
        imageUrls.add(imageUrl);
      }

      CarVehicle carVehicle = CarVehicle(
        carId: "",
        make: make,
        engine: engine,
        seatCapacity: seatCapacity,
        model: model,
        body: body,
        year: year,
        color: color,
        rentalPriceRange: rentalPriceRange,
        status: status,
        imageUrls: imageUrls,
        mainImageUrl: mainImageUrl,
      );

      final carMap = carVehicle.toFireStoreDocument();
      await firebaseFirestore.collection('cars').doc().set(carMap);

      resetForm();
      notifyListeners();
      MessageService.showSnackBar(context, 'Car details added successfully!');
    } catch (e) {
      if (kDebugMode) {
        print('Error in adding car details: $e');
      }
      if (e is Exception) {
        handleError(context, e);
      }
    } finally {
      setLoading(false);
    }
  }
}
