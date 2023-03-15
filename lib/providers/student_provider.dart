import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Student with ChangeNotifier {
  final String name;
  final String sheetno;
  final String grno;

  Student({
    required this.name,
    required this.sheetno,
    required this.grno,
  });

  Map<String, dynamic> getJson() =>
      {'name': name, 'sheetno': sheetno, 'grno': grno};

  factory Student.getModelFromJson({required Map<String, dynamic> json}) {
    return Student(
        name: json['name'], sheetno: json['sheetno'], grno: json['grno']);
  }

  bool _isLoading = true;

  get isLoading => _isLoading;

  void loadingstatus(bool val) {
    _isLoading = val;
  }

  final firebaseref = FirebaseFirestore.instance;

  List<Student> _students = [];

  get students => _students;

  Future<String> addStudent(
    Student student,
    String classNo,
  ) async {
    loadingstatus(true);
    await firebaseref
        .collection('Class')
        .doc(classNo)
        .collection('Students')
        .doc(student.grno)
        .set(student.getJson());

    loadingstatus(false);
    notifyListeners();
    return "successfull";
  }

  Future<void> studentsList(String className) async {
    List<Student> st = [];
    QuerySnapshot res = await firebaseref
        .collection('Class')
        .doc(className)
        .collection('Students')
        .get();

    res.docs.forEach((student) {
      st.add(Student(
          name: student['name'],
          sheetno: student['sheetno'],
          grno: student['grno']));
    });
    print(_students);
    _students = st;
    notifyListeners();
  }

  // Future<List<Student>> findStudent(String name , String classNo) async{
  //   List<Student> students = [];
  //   QuerySnapshot res = await firebaseref.collection('Class').doc()
  // }

  // Future<String> deleteStudent(String grNumber) {}
}
