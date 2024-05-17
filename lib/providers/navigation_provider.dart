import 'package:flutter/material.dart';
import 'package:shop_zila/pages/home_page.dart';

class NavigationMenuProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void setIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  final screens = [
    const HomePage(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.grey,
    ),
    Container(
      color: Colors.black,
    )
  ];
}
