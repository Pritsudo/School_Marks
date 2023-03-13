import 'package:flutter/cupertino.dart';

class TestSubjectSelect with ChangeNotifier {
  String _test = '';

  String get test => _test;

  void setTest(val) {
    if (_test.isNotEmpty) {
      _test == val ? _test = '' : _test = val;
    } else {
      _test = val;
    }
    print(_test);
    notifyListeners();
  }

  String _subject = '';

  String get subject => _subject;

  void setSubject(val) {
    _subject = val;
    notifyListeners();
  }
  // List<String> subjectList(String className)
  // {
  //   if(className=='')
  //   {

  //   }
  // }
}
