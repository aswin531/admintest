import 'package:admin_rent/controllers/providers/searchfilter/filter_provider.dart';
import 'package:admin_rent/controllers/providers/searchfilter/search_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FilterOptionsWidget extends StatelessWidget {
  const FilterOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<SearchFilterProvider>(context);
    final filterOptionsProvider = Provider.of<FilterOptionsProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Filters', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          DropdownButton<String>(
            value: filterProvider.selectedColor,
            hint: const Text('Select Color'),
            onChanged: (value) {
              filterProvider.setColor(value);
            },
            items: filterOptionsProvider.colors
                .map((color) => DropdownMenuItem(value: color, child: Text(color)))
                .toList(),
          ),
          DropdownButton<String>(
            value: filterProvider.selectedMake,
            hint: const Text('Select Make'),
            onChanged: (value) {
              filterProvider.setMake(value);
            },
            items: filterOptionsProvider.makes
                .map((make) => DropdownMenuItem(value: make, child: Text(make)))
                .toList(),
          ),
          DropdownButton<String>(
            value: filterProvider.selectedBody,
            hint: const Text('Select Body'),
            onChanged: (value) {
              filterProvider.setBody(value);
            },
            items: filterOptionsProvider.bodies
                .map((body) => DropdownMenuItem(value: body, child: Text(body)))
                .toList(),
          ),
          DropdownButton<String>(
            value: filterProvider.selectedModel,
            hint: const Text('Select Model'),
            onChanged: (value) {
              filterProvider.setModel(value);
            },
            items: filterOptionsProvider.models
                .map((model) => DropdownMenuItem(value: model, child: Text(model)))
                .toList(),
          ),
          DropdownButton<String>(
            value: filterProvider.selectedYear,
            hint: const Text('Select Year'),
            onChanged: (value) {
              filterProvider.setYear(value);
            },
            items: filterOptionsProvider.years
                .map((year) => DropdownMenuItem(value: year, child: Text(year)))
                .toList(),
          ),
          RangeSlider(
            values: filterProvider.priceRange,
            min: 0,
            max: 100000,
            divisions: 100,
            labels: RangeLabels(
              '${filterProvider.priceRange.start.round()}',
              '${filterProvider.priceRange.end.round()}',
            ),
            onChanged: (RangeValues values) {
              filterProvider.setPriceRange(values);
            },
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Apply Filters'),
          ),
        ],
      ),
    );
  }
}
