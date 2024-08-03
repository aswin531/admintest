import 'package:admin_rent/model/rental_request_model.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RentalRequestProvider with ChangeNotifier {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  List<RentalRequest> _requests = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<RentalRequest> get allRequests => _requests;
  bool get isLoading => _isLoading;
  bool get hasError => _errorMessage != null;
  String? get errorMessage => _errorMessage;

  List<RentalRequest> get pendingRequests =>
      _requests.where((r) => r.status == null).toList();
  List<RentalRequest> get acceptedRequests =>
      _requests.where((r) => r.status == true).toList();
  List<RentalRequest> get rejectedRequests =>
      _requests.where((r) => r.status == false).toList();

  Future<void> fetchRequests() async {
    if (_isLoading) return; // Prevent multiple simultaneous fetches

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final QuerySnapshot snapshot =
          await firebaseFirestore.collection('rental_requests').get();
      _requests = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        debugPrint('Document data: $data');
        return RentalRequest.fromJson(data);
      }).toList();
    } catch (e) {
      debugPrint('Error fetching rental requests: $e');
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void refreshRequests() {
    fetchRequests();
  }

  Future<void> approveRequest(RentalRequest request) async {
    try {
      final QuerySnapshot snapshot = await firebaseFirestore
          .collection("rental_requests")
          .where('phone', isEqualTo: request.phone)
          .get();
      if (snapshot.docs.isNotEmpty) {
        final docId = snapshot.docs.first.id;
        await firebaseFirestore
            .collection('rental_requests')
            .doc(docId)
            .update({'status': true});
        // Update the local list
        final index = _requests.indexWhere((r) => r.phone == request.phone);
        if (index != -1) {
          _requests[index].status = true;
        }
        notifyListeners();
      } else {
        debugPrint('No Matching request found for phone : ${request.phone}');
      }
    } catch (e) {
      debugPrint('Error approving Rental Request: $e');
    }
  }

  Future<void> rejectRequest(RentalRequest request) async {
    try {
      final QuerySnapshot snapshot = await firebaseFirestore
          .collection('rental_requests')
          .where('phone', isEqualTo: request.phone)
          .get();
      if (snapshot.docs.isNotEmpty) {
        final docId = snapshot.docs.first.id;
        await firebaseFirestore
            .collection('rental_requests')
            .doc(docId)
            .update({'status': false});
        // Update the local list
        final index = _requests.indexWhere((r) => r.phone == request.phone);
        if (index != -1) {
          _requests[index].status = false;
        }
        notifyListeners();
      } else {
        debugPrint('No Matching request found for phone : ${request.phone}');
      }
    } catch (e) {
      debugPrint('Error rejecting Rental Request: $e');
    }
  }
}
