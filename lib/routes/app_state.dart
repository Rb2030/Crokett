import 'package:crokett/routes/route_path.dart';
import 'package:flutter/material.dart';

class MenuItem {
  String title;

  MenuItem(this.title);
}

class AppState extends ChangeNotifier {
  // Class that selects the menu item in the burger menu
  bool _mainMenuSelected;
  MenuItem _selectedMenuItem = MenuItem('');

  final List<MenuItem> menuItems = [
    MenuItem(Profile),
    MenuItem(Boxes),
    MenuItem(Recipes),
    MenuItem(Cookshop),
    MenuItem(TipsAndTricks),
    MenuItem(Help),
    MenuItem(Settings),
  ];

  AppState() : _mainMenuSelected = false;

  bool get ifMenuSelected => _mainMenuSelected;

  set ifMenuSelected(bool menuSelected) {
    _mainMenuSelected = menuSelected;
    if (_mainMenuSelected == false) {
      // May need to remove this?

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
