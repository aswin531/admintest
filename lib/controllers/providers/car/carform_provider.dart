import 'package:flutter/material.dart';

class CarFormProvider with ChangeNotifier {
  String? selectedMake;
  String? selectedEngine;
  int? selectedYear;
  Color? selectedColor;
  String? model;
  String? body;
  bool isAvailable = false;
  int? seatCapacity;
  RangeValues? rentalPriceRange = const RangeValues(500, 10000);

  TextEditingController modelController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController seatCapacityController = TextEditingController();
  TextEditingController rentalPriceRangeController = TextEditingController();

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

  void updaterentalPriceRange(RangeValues? rentalPriceRange) {
    this.rentalPriceRange = rentalPriceRange;
    rentalPriceRangeController.text = rentalPriceRange?.toString() ?? '';
    notifyListeners();
  }

  @override
  void dispose() {
    modelController.dispose();
    bodyController.dispose();
    seatCapacityController.dispose();
    rentalPriceRangeController.dispose();
    super.dispose();
  }
}


























   // Method to update Firestore database
  // Future<void> saveToDatabase(String carId) async {
  //   await FirebaseFirestore.instance.collection('cars').doc(carId).update({
  //     'make': selectedMake,
  //     'engine': selectedEngine,
  //     'status': _isAvailable,
  //   });
  // }
