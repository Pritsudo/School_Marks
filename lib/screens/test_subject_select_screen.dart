import 'package:final_marks_manager/screens/student_data_screens_navigation.dart';
import 'package:final_marks_manager/widgets/subject_select_widget.dart';
import 'package:final_marks_manager/widgets/test_select_widget.dart';
import 'package:flutter/material.dart';

class TestSubjectSelectScreen extends StatelessWidget {
  static const routName = 'Test-Subject-Select-screen';
  const TestSubjectSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Subject And Test'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () => Navigator.pushNamed(
                      context, StudentDataScreensNavigation.routName),
                  child: const Text('Add a student'),
                ),
              ),
              const TestSelectWidget(),
              const SizedBox(
                height: 25,
              ),
              SubjectSelect(),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
