//  import 'package:admin_rent/controllers/providers/car/car_provider.dart';
// import 'package:flutter/material.dart';

// void showDeleteConfirmationDialog(BuildContext context, CarProvider carProvider, String carId, String carModel) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Confirm Delete'),
//           content: Text('Are you sure you want to delete $carModel?'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('Delete'),
//               onPressed: () async {
//                 Navigator.of(context).pop();
//                 try {
//                   await carProvider.deleteCarVehicle(context: context, carId: carId);
//                 } catch (e) {
//                   // Handle error
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }