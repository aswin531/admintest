import 'package:flutter/material.dart';

void showRejectDialog(BuildContext context, String requestId) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Reject Request'),
      content: TextField(
        decoration: const InputDecoration(hintText: 'Reason for rejection'),
        onSubmitted: (reason) {
          // _service.rejectRequest(requestId, reason);
          Navigator.of(context).pop();
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final reason = (context
                    .findAncestorWidgetOfExactType<AlertDialog>()
                    ?.content as TextField)
                .controller
                ?.text;
            if (reason != null && reason.isNotEmpty) {
              // _service.rejectRequest(requestId, reason);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Reject'),
        ),
      ],
    ),
  );
}
