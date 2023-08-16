import 'package:flutter/material.dart';

class ProductNotifier extends ChangeNotifier {
  int _activepage = 0;
  int get activepage => _activepage;

  set activepage(int newIndex) {
    _activepage = newIndex;
    notifyListeners();
  }

  List<dynamic> _shoesize = [];

  List<dynamic> get shoesize => _shoesize;

  set shoesize(List<dynamic> newindex) {
    _shoesize = newindex;
    notifyListeners();
  }
  
  List<String> _sizes = [];

  List<String> get sizes => _sizes;

  set sizes(List<String> newindex) {
    _sizes = newindex;
    notifyListeners();
  }
  void togglecolor(int index) {
    for (int i = 0; i < _shoesize.length; i++) {
      if (i == index) {
        _shoesize[i]["isSelected"] = !_shoesize[i]["isSelected"];
      }
    }
    notifyListeners();
  }
}
