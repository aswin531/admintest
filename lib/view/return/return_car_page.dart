import 'package:admin_rent/controllers/providers/return/return_provider.dart';
import 'package:admin_rent/model/car_return_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AdminReturnDashboard extends StatelessWidget {
  const AdminReturnDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final returnCarProvider = Provider.of<ReturnCarProvider>(context);

    return StreamBuilder(
      stream: returnCarProvider.getPendingReturns(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Lottie.asset('assets/animations/loading.json');
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No pending returns"));
        }

        var pendingReturns = snapshot.data!.docs;

        return ListView.builder(
          itemCount: pendingReturns.length,
          itemBuilder: (context, index) {
            var rental = pendingReturns[index];

            return ListTile(
              title: Text('Car ID: ${rental['carId']}'),
              subtitle: Text('Return Initiated: ${rental['return_initiated_at']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Admin approves the return
                        final data = rental.data() as Map<String, dynamic>; 
                      returnCarProvider.confirmReturn(
                        rental.id,
                        CarReturnModel.fromJson(data),
                      );
                    },
                    child: const Text('Approve'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Admin rejects the return
                      returnCarProvider.rejectReturn(
                        rental.id,
                        "Damages found", // Admin input for rejection reason
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Reject'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
