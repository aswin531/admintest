

import 'package:flutter/material.dart';

class ReusableFilterChip extends StatelessWidget {
  final String label;
  final String filterValue;
  final bool isSelected;
  final Function(bool) onSelected;

  const ReusableFilterChip({
    super.key,
    required this.label,
    required this.filterValue,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: onSelected,
      selectedColor: Colors.blue.shade100,
      checkmarkColor: Colors.blue,
      backgroundColor: Colors.grey.shade200,
      labelStyle: TextStyle(
        color: isSelected ? Colors.blue : Colors.black87,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}