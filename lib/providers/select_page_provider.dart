import 'package:flutter/cupertino.dart';

class SelectPage with ChangeNotifier {
  int _selectedPage = 0;

  int get selectedPage => _selectedPage;

  int setPageNumber(int pageNumber) {
    _selectedPage = pageNumber;
    notifyListeners();
    return _selectedPage;
  }
}
