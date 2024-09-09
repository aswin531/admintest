import 'package:admin_rent/model/car_return_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReturnCarProvider with ChangeNotifier {
  final FirebaseFirestore firebaseFirestore;

  ReturnCarProvider(this.firebaseFirestore);

  Future<void> confirmReturn(String rentalId, CarReturnModel returnModel) async {
    try {
      await firebaseFirestore.collection('rental_requests').doc(rentalId).update({
        'return_status': 'returned',
        'return_details': returnModel.toJson(),
        'status': 'returned',
        'returned_at': DateTime.now().toIso8601String(),
      });
      notifyListeners(); 
    } catch (e) {
      throw Exception("Failed to confirm return: $e");
    }
  }

  Future<void> rejectReturn(String rentalId, String reason) async {
    try {
      await firebaseFirestore.collection('rental_requests').doc(rentalId).update({
        'status': 'return_rejected',
        'rejection_reason': reason,
      });
      notifyListeners(); 
    } catch (e) {
      throw Exception("Failed to reject return: $e");
    }
  }

  Stream<QuerySnapshot> getPendingReturns() {
    return firebaseFirestore
        .collection('rental_requests')
        .where('status', isEqualTo: 'return_initiated')
        .snapshots();
  }
}
