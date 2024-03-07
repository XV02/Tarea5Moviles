import 'package:flutter/material.dart';
import 'package:tarea_5/shared/interfaces/forage_element.dart';

class ForageListProvider with ChangeNotifier {
  final List<ForageElement> _forages = [];
  ForageElement _selectedForage = ForageElement();

  ForageElement get selectedForage => _selectedForage;
  List<ForageElement> get forages => _forages;

  void setSelectedForage(ForageElement forage) {
    _selectedForage = forage;
    notifyListeners();
  }

  void addForage(ForageElement forage) {
    _forages.add(forage);
    notifyListeners();
  }

  int length() {
    return _forages.length;
  }

  ForageElement get(int index) {
    return _forages[index];
  }
}
