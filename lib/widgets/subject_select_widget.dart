import 'package:final_marks_manager/providers/class_operation_provider.dart';
import 'package:final_marks_manager/providers/test_subject_select_provider.dart';
import 'package:final_marks_manager/screens/add_student_screen.dart';
import 'package:final_marks_manager/screens/student_screens_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectSelect extends StatelessWidget {
  SubjectSelect({Key? key}) : super(key: key);
  List<String> subjects = [
    'Gujarati',
    'Hindi',
    'English',
    'Computer',
    'Science',
    'Maths',
    'Biology',
    'Sanskrit',
    'Pt'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 370,
      child: Card(
        color: Colors.blue[200],
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            const Text(
              'Select Subject',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 230,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Consumer<TestSubjectSelect>(
                        builder: (_, value, child) {
                          return Card(
                            elevation: 5,
                            child: InkWell(
                              onTap: () {
                                value.setSubject(subjects[index]);
                                Navigator.pushNamed(
                                    context, StudentScreensNavigation.routName);
                              },
                              child: ListTile(
                                title: Text(subjects[index],
                                    style: TextStyle(fontSize: 18)),
                                trailing: Icon(Icons.send_rounded),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    itemCount: subjects.length,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
