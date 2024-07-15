import 'package:flutter/material.dart';

class SidebarProvider with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setPage(int pageIndex) {
    _currentPage = pageIndex;
    notifyListeners();
  }
}
