import 'package:flutter/material.dart';

class SidebarProvider extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void setPage(int pageIndex) {
    _currentPage = pageIndex;
    notifyListeners();
  }
}
