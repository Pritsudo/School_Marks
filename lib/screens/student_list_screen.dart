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
  @override
  void initState() {
    final className =  Provider.of<ClassOperation>(context,listen: false).selectedClass;
    Provider.of<Student>(context).studentsList(className);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Card(
          color: Colors.blue[200],
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              child: InkWell(
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //     context, TestSubjectSelectScreen.routName);
                                },
                                child: ListTile(
                                  title: Text(value.students[index],
                                      style: TextStyle(fontSize: 18)),
                                  trailing: Icon(Icons.send_rounded),
                                ),
                              ),
                            );
                          },
                          itemCount: value.students.length,
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
