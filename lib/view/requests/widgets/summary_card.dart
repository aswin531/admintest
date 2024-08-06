import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;
  //final VoidCallback onTap;

  const SummaryCard({super.key, required this.title, required this.count, required this.color,
  //required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: onTap,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Container(
          width: 140,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
