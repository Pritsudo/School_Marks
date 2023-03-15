import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_marks_manager/providers/student_provider.dart';
import 'package:flutter/material.dart';

class MarksOperation with ChangeNotifier {
  final firebaseref = FirebaseFirestore.instance;

  Future fetchOneStudentMarks(
    Student student,
    String className,
    String subjectName,
  ) async {
    final marks = await firebaseref
        .collection('Class')
        .doc(className)
        .collection('Students')
        .doc(student.grno)
        .collection('Marks')
        .doc(subjectName)
        .get();
    return marks.data();
  }

  Future<void> sendMarksToDb(
      List<TextEditingController> studentsMarks,
      String className,
      String subjectName,
      String testName,
      List<Student> students) async {
    var marksData =
        await fetchOneStudentMarks(students[0], className, subjectName)
            as dynamic;

    if (marksData == null) {
      for (int i = 0; i < studentsMarks.length; i++) {
        await firebaseref
            .collection('Class')
            .doc(className)
            .collection('Students')
            .doc(students[i].grno)
            .collection('Marks')
            .doc(subjectName)
            .set({testName: studentsMarks[i].text});
      }
    } else {
      for (int i = 0; i < studentsMarks.length; i++) {
        await firebaseref
            .collection('Class')
            .doc(className)
            .collection('Students')
            .doc(students[i].grno)
            .collection('Marks')
            .doc(subjectName)
            .update({testName: studentsMarks[i].text});
      }
    }

    // if (marksData.containsKey(testName)) {
    //   print(marksData[testName]);
    //   // Update Marks Code
    // } else
    //   print('Not Submited');
  }

  Future fetchStudentsMarks(
      List<TextEditingController> studentsMarks,
      String className,
      String subjectName,
      String testName,
      List<Student> students) async {
    for (int i = 0; i < studentsMarks.length; i++) {
      var marks =
          await fetchOneStudentMarks(students[i], className, subjectName);
      studentsMarks[i].text = marks[testName];
    }
    return studentsMarks;
  }

  // Future updateOneStudentMark(
  //     List<TextEditingController> studentsMarks,
  //     String className,
  //     String subjectName,
  //     String testName,
  //     List<Student> students) {}
}
