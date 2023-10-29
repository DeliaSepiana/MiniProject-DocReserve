import 'package:flutter/material.dart';
import 'package:project/views/history_page.dart';
import 'package:project/views/home_page.dart';

class BottomNavBarViewModel with ChangeNotifier {
  int _currentIndex = 0;
  List<Widget> _pages = [HomePage(), HistoryPage()];

  int get currentIndex => _currentIndex;
  Widget get currentPage => _pages[_currentIndex];

  void changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
