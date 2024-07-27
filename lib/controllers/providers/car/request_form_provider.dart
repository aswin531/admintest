import 'package:admin_rent/model/rental_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RentalRequestProvider with ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  List<RentalRequest> _requests = [];
  List<RentalRequest> get requests => _requests;

  Future<void> fetchRequests() async {
    try {
      final QuerySnapshot snapshot =
          await _firebaseFirestore.collection('rental_requests').get();
      _requests = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        print('Document data: $data');
        return RentalRequest.fromJson(data);
      }).toList();
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching rental requests: $e');
    }
  }

  // Future<void> approveRequest(RentalRequest request) async {
  //   try {
  //     await _firebaseFirestore
  //         .collection('rentalRequests')
  //         .update({'status': 'approved'});
  //     _requests.removeWhere((r) => r.id == request.id);
  //     notifyListeners();
  //   } catch (e) {
  //     debugPrint('Error approving rental request: $e');
  //   }
  // }

  // Future<void> rejectRequest(RentalRequest request) async {
  //   try {
  //     await _firebaseFirestore
  //         .collection('rentalRequests')
  //         .doc(request.id)
  //         .update({'status': 'rejected'});
  //     _requests.removeWhere((r) => r.id == request.id);
  //     notifyListeners();
  //   } catch (e) {
  //     debugPrint('Error rejecting rental request: $e');
  //   }
  // }
}
