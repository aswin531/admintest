import 'package:admin_rent/model/rental_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RentalRequestProvider with ChangeNotifier {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  List<RentalRequest> _requests = [];
  List<RentalRequest> get requests => _requests;

  Future<void> fetchRequests() async {
    try {
      final QuerySnapshot snapshot =
          await firebaseFirestore.collection('rental_requests').get();
      _requests = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        debugPrint('Document data: $data');
        return RentalRequest.fromJson(data);
      }).toList();
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching rental requests: $e');
    }
  }

  Future<void> approveRequest(RentalRequest request) async {
    try {
      //find the document with the matching phone number
      final QuerySnapshot snapshot = await firebaseFirestore
          .collection("rental_requests")
          .where('phone', isEqualTo: request.phone)
          .get();
      // Check if any documents match the query
      // after finding the unique identifier by firestore
      if (snapshot.docs.isNotEmpty) {
        final docId = snapshot.docs.first.id;
        await firebaseFirestore
            .collection('rental_requests')
            .doc(docId)
            .update({'status': true});
                    // Remove the ACCEPTED request from the local list and notify listeners
        _requests.removeWhere((element) => element.phone == request.phone);
        notifyListeners();
      } else {
        debugPrint('No Matching request found for phone : ${request.phone}');
      }
    } catch (e) {
      debugPrint('Error approving Rental Request: $e');
    }
  }

  Future<void> rejectRequest(RentalRequest request) async{
    try{
      final QuerySnapshot snapshot = await firebaseFirestore.collection('rental_requests').where('phone',isEqualTo: request.phone).get();
      if(snapshot.docs.isNotEmpty){
        final docId = snapshot.docs.first.id;
        await firebaseFirestore.collection('rental_requests').doc(docId).update({'status':false});
        // Remove the REJECTED request from the local list and notify listeners
        _requests.removeWhere((element) => element.phone == request.phone,);
        notifyListeners();
      }else{
               debugPrint('No Matching request found for phone : ${request.phone}');
      }
    }catch(e){
            debugPrint('Error rejecting Rental Request: $e');

    }
  }
}
