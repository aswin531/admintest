import 'package:admin_rent/style/colors.dart';
import 'package:flutter/material.dart';

class CarFormProvider with ChangeNotifier {
  String? selectedMake;
  String? selectedEngine;
  int? selectedYear;
  Color? selectedColor;
  String? model;
  String? body;
  int? seatCapacity;
  double? rentalPriceDay;

  TextEditingController modelController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController seatCapacityController = TextEditingController();
  TextEditingController rentalPriceDayController = TextEditingController();

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

  void updateSeatCapacity(int? seatCapacity) {
    this.seatCapacity = seatCapacity;
    seatCapacityController.text = seatCapacity?.toString() ?? '';
    notifyListeners();
  }

  void updateRentalPriceDay(double? rentalPriceDay) {
    this.rentalPriceDay = rentalPriceDay;
    rentalPriceDayController.text = rentalPriceDay?.toString() ?? '';
    notifyListeners();
  }

  @override
  void dispose() {
    modelController.dispose();
    bodyController.dispose();
    seatCapacityController.dispose();
    rentalPriceDayController.dispose();
    super.dispose();
  }
}



