import 'package:crokett/routes/route_path.dart';
import 'package:flutter/material.dart';

class MenuItem {
  String title;

  MenuItem(this.title);
}

class AppState extends ChangeNotifier {
  int _selectedIndex;
  late MenuItem _selectedMenuItem;

  final List<MenuItem> menuItems = [
    MenuItem(Profile),
    MenuItem(Boxes),
    MenuItem(Recipes),
    MenuItem(Cookshop),
    MenuItem(TipsAndTricks),
    MenuItem(Help),
  ];
  
  AppState() : _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int idx) {
    _selectedIndex = idx;
    if (_selectedIndex == 1) {
      // Remove this line if you want to keep the selected menu section when navigating
      // between "settings" and "main menu" which menu section was selected when Settings is
      // tapped.
      selectedMenuItem = MenuItem('');
    }
    notifyListeners();
  }

  MenuItem get selectedMenuItem => _selectedMenuItem;

  set selectedMenuItem(MenuItem menuItem) {
    _selectedMenuItem = menuItem;
    notifyListeners();
  }

  int getSelectedMenuItemById() {
    if (!menuItems.contains(_selectedMenuItem)) return 0;
    return menuItems.indexOf(_selectedMenuItem);
  }

  void setSelectedMenuItemById(int id) {
    if (id < 0 || id > menuItems.length - 1) {
      return;
    }

    _selectedMenuItem = menuItems[id];
    notifyListeners();
  }
}
