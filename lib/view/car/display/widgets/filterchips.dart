
import 'package:admin_rent/controllers/providers/car/carfilter_provider.dart';
import 'package:admin_rent/view/widgets/filter_chip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<CarFilterChipProvider>(context);
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Wrap(
        spacing: 8,
        children: [
          ReusableFilterChip(
            label: 'Recently Added',
            filterValue: 'recent',
            isSelected: filterProvider.isSelected('recent'),
            onSelected: (selected) => filterProvider.toggleFilter('recent'),
          ),
          ReusableFilterChip(
            label: 'SUVs',
            filterValue: 'suv',
            isSelected: filterProvider.isSelected('suv'),
            onSelected: (selected) => filterProvider.toggleFilter('suv'),
          ),
          ReusableFilterChip(
            label: 'Electric',
            filterValue: 'electric',
            isSelected: filterProvider.isSelected('electric'),
            onSelected: (selected) => filterProvider.toggleFilter('electric'),
          ),
          // Add more ReusableFilterChip widgets for other categories
        ],
      ),
    );
  }
}
