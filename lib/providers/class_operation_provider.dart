import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClassOperation with ChangeNotifier {
  List<String> _classes = [];

  List<String> get classes => _classes;

  String _selectedClass = '';

  String get selectedClass => _selectedClass;

  void setClass(val) {
    _selectedClass = val;
    notifyListeners();
    print(_selectedClass);
  }

  final firebaseref = FirebaseFirestore.instance;

  Future<String> addNewClass(String className) async {
    _classes.add(className);
    await firebaseref
        .collection('Class')
        .doc(className)
        .set({'name': className});
    notifyListeners();
    return "successfull";
  }

  Future<void> fetchClasses() async {
    List<String> clsNames = [];
    final classes = await firebaseref.collection('Class').get();
    classes.docs.forEach((cls) {
      clsNames.add(cls['name']);
    });
    _classes = clsNames;
    notifyListeners();
  }

  // Here to add bool function for acknowledgement.
  
  Future<void> deleteClass(String className) async {
    bool isDeleted = _classes.remove(className);

    await firebaseref.collection('Class').doc(className).delete();
    if (isDeleted) {
      // return "successful";
    }
    // return "Some error occur";
    notifyListeners();
  }

  // notifyListeners();
}
