import 'package:flutter/material.dart';
import 'package:tarea_5/shared/interfaces/forage_element.dart';

class ForageListProvider with ChangeNotifier {
  final List<ForageElement> _forages = [];

  List<ForageElement> getForages() {
    return _forages;
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
