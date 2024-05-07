import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  final List<String> _nameList = [
    "Agents",
    "Weapons",
    "Maps",
    "Ranks",
    "PLayer\nCards",
    "Gun\nBuddies"
  ];

  HomeProvider() {
    _filteredList = _nameList;
  }

  List<String> _filteredList = [];

  List<String> get nameList => _nameList;
  List<String> get filteredList => _filteredList;

  void runFilter(String enteredKeyboard) {
    if (enteredKeyboard.isEmpty) {
      _filteredList = _nameList;
    } else {
      _filteredList = _nameList
          .where((element) =>
              element.toLowerCase().contains(enteredKeyboard.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
