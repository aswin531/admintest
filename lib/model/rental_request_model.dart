import 'package:cloud_firestore/cloud_firestore.dart';

class RentalRequest {
  final String carId;
  final String userId;
  final DateTime startDate;
  final DateTime endDate;
  final String address;
  final String deliveryTime;
  final bool isPickup;
  final String deliveryPlace;
  final String pickupArrival;
  final String pickupTime;
  final bool isDelivery;
  final String phone;
  final String name;
  final String comment;
  final String licenseNumber;
  final bool status;

  RentalRequest({
    required this.carId,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.address,
    required this.deliveryTime,
    required this.isPickup,
    required this.deliveryPlace,
    required this.pickupArrival,
    required this.pickupTime,
    required this.isDelivery,
    required this.phone,
    required this.name,
    required this.comment,
    required this.licenseNumber,
    required this.status,
  });

  factory RentalRequest.fromJson(Map<String, dynamic> json) {
    return RentalRequest(
      carId: json['carId'] ?? 'Unknown Car',
      userId: json['userId'] ?? 'Unknown User',
      startDate: (json['startDate'] as Timestamp).toDate(),
      endDate: (json['endDate'] as Timestamp).toDate(),
      address: json['address'] ?? '',
      deliveryTime: json['deliveryTime'] ?? '',
      isPickup: json['isPickup'] ?? false,
      deliveryPlace: json['deliveryPlace'] ?? '',
      pickupArrival: json['pickupArrival'] ?? '',
      pickupTime: json['pickupTime'] ?? '',
      isDelivery: json['isDelivery'] ?? false,
      phone: json['phone'] ?? '',
      name: json['name'] ?? '',
      comment: json['comment'] ?? '',
      licenseNumber: json['licenseNumber'] ?? '',
      status: json['status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'carId': carId,
      'userId': userId,
      'startDate': Timestamp.fromDate(startDate),
      'endDate': Timestamp.fromDate(endDate),
      'address': address,
      'deliveryTime': deliveryTime,
      'isPickup': isPickup,
      'deliveryPlace': deliveryPlace,
      'pickupArrival': pickupArrival,
      'pickupTime': pickupTime,
      'isDelivery': isDelivery,
      'phone': phone,
      'name': name,
      'comment': comment,
      'licenseNumber': licenseNumber,
      'status': status,
    };
  }
}
