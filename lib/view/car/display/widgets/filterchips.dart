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
            onSelected: (selected) => filterProvider.toggleFilter(
                'recent'), //callBack Function when chip is selected/deselected ( toggles the state of the 'recent')
          ),
          ReusableFilterChip(
            label: 'Ford',
            filterValue: 'Ford',
            isSelected: filterProvider.isSelected('Ford'),
            onSelected: (selected) => filterProvider.toggleFilter('Ford'),
          ),
          ReusableFilterChip(
            label: 'Diesel 2',
            filterValue: 'Diesel 2',
            isSelected: filterProvider.isSelected('Diesel 2'),
            onSelected: (selected) => filterProvider.toggleFilter('Diesel 2'),
          ),
        ],
      ),
    );
  }
}
