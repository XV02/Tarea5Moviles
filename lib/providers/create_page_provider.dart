import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tarea_5/shared/interfaces/forage_element.dart';

class CreatePageProvider with ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  bool _isInSeason = false;
  final ForageElement _forageElement = ForageElement();

  TextEditingController get nameController => _nameController;
  TextEditingController get locationController => _locationController;
  TextEditingController get notesController => _notesController;
  bool get isInSeason => _isInSeason;
  ForageElement get forageElement => _forageElement;

  void toggleIsInSeason() {
    _isInSeason = !_isInSeason;
    notifyListeners();
  }

  void saveForage() {
    _forageElement.name = _nameController.text;
    _forageElement.location = _locationController.text;
    _forageElement.notes = _notesController.text;
    _forageElement.isInSeason = _isInSeason;
  }
}
