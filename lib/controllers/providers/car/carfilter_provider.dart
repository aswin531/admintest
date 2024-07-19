import 'package:flutter/foundation.dart';

class CarFilterChipProvider extends ChangeNotifier {
  final Set<String> _selectedFilters = {};

  Set<String> get selectedFilters => _selectedFilters;

  bool isSelected(String filterValue) => _selectedFilters.contains(filterValue);

  void toggleFilter(String filterValue) {
    if (_selectedFilters.contains(filterValue)) {
      _selectedFilters.remove(filterValue);
    } else {
      _selectedFilters.add(filterValue);
    }
    notifyListeners();
  }

  void clearFilters() {
    _selectedFilters.clear();
    notifyListeners();
  }

  // Optional: Method to set a single filter (replacing all others)
  void setSingleFilter(String filterValue) {
    _selectedFilters.clear();
    _selectedFilters.add(filterValue);
    notifyListeners();
  }
}