import 'package:flutter/material.dart';

class InteractiveMessageContainer extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color iconColor;

  const InteractiveMessageContainer({
    super.key,
    required this.message,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.blue),
            onPressed: () {
              // Handle info button press
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Information'),
                  content: Text(message),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
