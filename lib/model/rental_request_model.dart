import 'package:admin_rent/utils/status_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RentalRequest {
  final String carId;
  final String userId;
  final DateTime pickupDate;
  final DateTime returnDate;
  final String address;
  final DateTime returnTime;
  final DateTime pickupTime;
  final String phone;
  final String name;
  final String comment;
  final String licenseNumber;
  RentalRequestStatus status;
  final double estimatedCost;
  final String dropOffLocation;
  final String pickUpLocation;

  RentalRequest( 
      {required this.carId,
      required this.userId,
      required this.pickupDate,
      required this.returnDate,
      required this.address,
      required this.returnTime,
      required this.pickupTime,
      required this.phone,
      required this.name,
      required this.comment,
      required this.licenseNumber,
      required this.status,
      required this.dropOffLocation,
      required this.pickUpLocation,
      required this.estimatedCost});

  factory RentalRequest.fromJson(Map<String, dynamic> json) {
    return RentalRequest(
        carId: json['carId'] ?? 'Unknown Car',
        userId: json['userId'] ?? 'Unknown User',
        pickupDate: (json['pickupDate']).toDate(),
        returnDate: (json['returnDate']).toDate(),
        address: json['address'] ?? '',
        returnTime: (json['returnTime']).toDate(),
        pickupTime: (json['pickupTime']).toDate(),
        phone: json['phone'] ?? '',
        name: json['name'] ?? '',
        comment: json['comment'] ?? '',
        licenseNumber: json['licenseNumber'] ?? '',
        status: RentalRequestStatus.values.firstWhere(
            (element) =>
                element.toString() == 'RentalRequestStatus.${json['status']}',
            orElse: () => RentalRequestStatus.pending),
        estimatedCost: json['estimatedCost'],
        pickUpLocation: json['pickUpLocation'] ?? "pickUpLocation",
        dropOffLocation: json['dropOffLocation'] ?? "dropOffLocation");
  }

  Map<String, dynamic> toJson() {
    return {
      'carId': carId,
      'userId': userId,
      'pickupDate': Timestamp.fromDate(pickupDate),
      'returnDate': Timestamp.fromDate(returnDate),
      'address': address,
      'deliveryTime': returnTime,
      'pickupTime': pickupTime,
      'phone': phone,
      'name': name,
      'comment': comment,
      'licenseNumber': licenseNumber,
      'status': status.toString().split('.').last,
    };
  }
}
