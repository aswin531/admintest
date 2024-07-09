import 'package:flutter/material.dart';

class RejectionReason {
  final String code;
  final String description;

  RejectionReason(this.code, this.description);
}

final List<RejectionReason> commonReasons = [
  RejectionReason('UNAVAILABLE', 'Vehicle unavailable for requested dates'),
  RejectionReason('HISTORY', 'Issues with user rental history'),
  RejectionReason('DOCUMENTATION', 'Insufficient documentation'),
  // Add more reasons...
];

class RejectionDialog extends StatelessWidget {
  const RejectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Reject Application'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            items: commonReasons.map((reason) => DropdownMenuItem(
              value: reason.code,
              child: Text(reason.description),
            )).toList(),
            onChanged: (value) {
              // Handle selection
            },
            decoration: const InputDecoration(labelText: 'Select Reason'),
          ),
          const TextField(
            decoration: InputDecoration(labelText: 'Additional Comments'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Handle cancellation
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Handle rejection
          },
          child: const Text('Reject'),
        ),
      ],
    );
  }
}


//UI 
// showDialog(
//   context: context,
//   builder: (BuildContext context) {
//     return RejectionDialog();
//   },
// );
