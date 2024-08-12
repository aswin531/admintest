
import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:flutter/foundation.dart';

class FilterOptionsProvider extends ChangeNotifier {
  CarProvider _carProvider;
  List<String> colors = [];
  List<String> makes = [];
  List<String> bodies = [];
  List<String> models = [];
  List<String> years = [];

  FilterOptionsProvider(this._carProvider) {
    _fetchFilterOptions();
  }

 void update(CarProvider carProvider) {
    if (_carProvider != carProvider) {
      _carProvider = carProvider;
      _fetchFilterOptions();
    }
  }
  
  Future<void> _fetchFilterOptions() async {
    colors = await _carProvider.getUniqueValues('color');
    makes = await _carProvider.getUniqueValues('make');
    bodies = await _carProvider.getUniqueValues('body');
    models = await _carProvider.getUniqueValues('model');
    years = await _carProvider.getUniqueValues('year');
    notifyListeners();
  }
}
