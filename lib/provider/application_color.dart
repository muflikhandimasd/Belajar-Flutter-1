import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier {
  bool _isLightBlue = true;

  bool get isLightBlue => _isLightBlue;

  set isLightBlue(bool newValue) {
    _isLightBlue = newValue;
    notifyListeners();
    // notifyListeners() untuk ngasih tau si consumer
  }

  Color get color => (_isLightBlue) ? Colors.lightBlue : Colors.amber;
}
