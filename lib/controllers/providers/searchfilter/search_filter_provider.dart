import 'package:flutter/material.dart';

class SearchFilterProvider extends ChangeNotifier {
  String _searchQuery = "";
  final Set<String> _selectedFilters = {};
  String? _selectedColor;
  String? _selectedMake;
  String? _selectedBody;
  String? _selectedModel;
  String? _selectedYear;
  RangeValues _priceRange = const RangeValues(0, 100000);

  String get searchQuery => _searchQuery;
  Set<String> get selectedFilters => _selectedFilters;
  String? get selectedColor => _selectedColor;
  String? get selectedMake => _selectedMake;
  String? get selectedBody => _selectedBody;
  String? get selectedModel => _selectedModel;
  String? get selectedYear => _selectedYear;
  RangeValues get priceRange => _priceRange;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setColor(String? color) {
    _selectedColor = color;
    notifyListeners();
  }

  void setMake(String? make) {
    _selectedMake = make;
    notifyListeners();
  }

  void setBody(String? body) {
    _selectedBody = body;
    notifyListeners();
  }

  void setModel(String? model) {
    _selectedModel = model;
    notifyListeners();
  }

  void setYear(String? year) {
    _selectedYear = year;
    notifyListeners();
  }

  void setPriceRange(RangeValues range) {
    _priceRange = range;
    notifyListeners();
  }

  void clearFilters() {
    _selectedFilters.clear();
    _selectedColor = null;
    _selectedMake = null;
    _selectedBody = null;
    _selectedModel = null;
    _selectedYear = null;
    _priceRange =const RangeValues(0, 100000);
    notifyListeners();
  }
}
