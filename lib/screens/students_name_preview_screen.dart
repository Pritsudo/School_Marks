import 'package:final_marks_manager/providers/class_operation_provider.dart';
import 'package:final_marks_manager/providers/marks_operation_provider.dart';
import 'package:final_marks_manager/providers/student_provider.dart';
import 'package:final_marks_manager/providers/test_subject_select_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentsNamePreviewScreen extends StatefulWidget {
  const StudentsNamePreviewScreen({Key? key}) : super(key: key);

  @override
  State<StudentsNamePreviewScreen> createState() =>
      _StudentsNamePreviewScreenState();
}

class _StudentsNamePreviewScreenState extends State<StudentsNamePreviewScreen> {
  late List<TextEditingController> controllers = [];

  late String className;
  late int studentsLength;

  @override
  void initState() {
    super.initState();
    final className =
        Provider.of<ClassOperation>(context, listen: false).selectedClass;
    final provider = Provider.of<Student>(context, listen: false);
    provider.studentsList(className);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Card(
          color: Colors.blue[200],
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 500,
                    child: Consumer<Student>(
                      builder: (_, value, child) {
                        print(value.students.length);
                        return Column(
                          children: [
                            Container(
                              height: 450,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Card(
                                      elevation: 5,
                                      child: ListTile(
                                        title: Text(value.students[index].name,
                                            style: TextStyle(fontSize: 18)),
                                        subtitle: Text(value.students[index].sheetno),
                                        trailing: Container(
                                          width: 50,
                                        ),
                                      ));
                                },
                                itemCount: value.students.length,
                              ),
                            ),
                            Text('Total Students :- ' + value.students.length.toString(),style: TextStyle(fontSize: 20),)
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
