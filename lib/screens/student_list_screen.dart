import 'package:final_marks_manager/providers/class_operation_provider.dart';
import 'package:final_marks_manager/providers/marks_operation_provider.dart';
import 'package:final_marks_manager/providers/student_provider.dart';
import 'package:final_marks_manager/providers/test_subject_select_provider.dart';
import 'package:final_marks_manager/widgets/class_select_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  late List<TextEditingController> controllers = [];

  late String testName;
  late String className;
  late String subjectName;
  late var studentProvider;

  @override
  void initState() {
    super.initState();
    className =
        Provider.of<ClassOperation>(context, listen: false).selectedClass;
    final provider = Provider.of<Student>(context, listen: false);
    provider.studentsList(className);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Did Changed Dependency Runnerd');
    studentProvider = Provider.of<Student>(context).students;
    for (int i = 0; i < studentProvider.length; i++) {
      controllers.add(TextEditingController());
    }
    final test_subject_provider =
        Provider.of<TestSubjectSelect>(context, listen: false);
    testName = test_subject_provider.test;
    subjectName = test_subject_provider.subject;
  }

  @override
  Widget build(BuildContext context) {
    print('Print Methode Runned');
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Card(
        color: Colors.blue[200],
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
             Text(
              "Enter "+testName +" Marks",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 300,
                  child: Consumer<Student>(
                    builder: (_, value, child) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                              elevation: 5,
                              child: ListTile(
                                title: Text(value.students[index].name,
                                    style: TextStyle(fontSize: 18)),
                                subtitle: Text(value.students[index].grno),
                                trailing: Container(
                                  width: 25,
                                  child: TextField(
                                    controller: controllers[index],
                                  ),
                                ),
                              ));
                        },
                        itemCount: value.students.length,
                      );
                    },
                  ),
                )),
            RaisedButton(
              onPressed: () {
                Provider.of<MarksOperation>(context, listen: false)
                    .fetchStudentsMarks(controllers, className, subjectName,
                        testName, studentProvider);

              },
              child: Text('Fetch Marks'),
            ),
          ],
        ),
      ),
    );
  }
}


/*

import 'package:final_marks_manager/providers/class_operation_provider.dart';
import 'package:final_marks_manager/providers/student_provider.dart';
import 'package:final_marks_manager/widgets/class_select_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    final className =
        Provider.of<ClassOperation>(context, listen: false).selectedClass;
    Provider.of<Student>(context, listen: false).studentsList(className);
    super.initState();
  }

  List<String> ss = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Card(
        color: Colors.blue[200],
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Form(
          key: formGlobalKey,
          child: Column(
            children: [
              const Text(
                'Students List',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 300,
                    child: Consumer<Student>(
                      builder: (_, value, child) {
                        return Column(
                          children: [
                            Container(
                              height: 250,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 5,
                                    child: ListTile(
                                        title: Text(value.students[index].name,
                                            style: TextStyle(fontSize: 18)),
                                        subtitle:
                                            Text(value.students[index].grno),
                                        trailing: Container(
                                          width: 30,
                                          child: TextFormField(
                                            onChanged: (value) {
                                              var v = value;
                                              ss.add(v);
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Give',
                                            ),
                                          ),
                                        )),
                                  );
                                },
                                itemCount: value.students.length,
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {
                                if (formGlobalKey.currentState!.validate()) {
                                  print(ss);
                                }
                              },
                              child: Text('Submit'),
                            )
                          ],
                        );
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}




*/