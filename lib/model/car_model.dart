import 'package:flutter/material.dart';

class CarVehicle {
  String carId;
  String make;
  String engine;
  int seatCapacity;
  String model;
  String body;
  int year;
  String color;
  RangeValues rentalPriceRange;
  bool status;
  String mainImageUrl;
  List<String> imageUrls;

  CarVehicle(
      {required this.carId,
      required this.make,
      required this.engine,
      required this.seatCapacity,
      required this.model,
      required this.body,
      required this.year,
      required this.color,
      required this.rentalPriceRange,
      required this.status,
      required this.imageUrls,
      required this.mainImageUrl});

  Map<String, dynamic> toFireStoreDocument() {
    return {
      "make": make,
      "engine": engine,
      "seatCapacity": seatCapacity,
      "model": model,
      "body": body,
      "year": year,
      "color": color,
      'rentalPriceRange': {
        'start': rentalPriceRange.start,
        'end': rentalPriceRange.end,
      },
      "status": status,
      "mainimageUrl": mainImageUrl,
      "imageUrls": imageUrls,
    };
  }

  factory CarVehicle.fromFirestoreDcument(Map<String, dynamic> map, String id) {
   // debugPrint('===Start ==Document Data: $map  ===End==');
    return CarVehicle(
        carId: id,
        make: map["make"] ?? "Toyota",
        engine: map["engine"] ?? "Camry",
        seatCapacity: map["seatCapacity"] ?? 5,
        model: map["model"] ?? "Unknown Model",
        body: map["body"] ?? "Unknown Body",
        year: map["year"] ?? 2000,
        color: map["color"] ?? "Unknown Color",
        rentalPriceRange: map['rentalPriceRange'] != null
            ? RangeValues(
                map['rentalPriceRange']['start']?.toDouble() ?? 0.0,
                map['rentalPriceRange']['end']?.toDouble() ?? 0.0,
              )
            : const RangeValues(0.0, 0.0),
        status: map["status"] ?? false,
        imageUrls: List<String>.from(map["imageUrls"] ?? []),
        mainImageUrl: map["mainImageUrl"] as String? ?? '');
  }
}
