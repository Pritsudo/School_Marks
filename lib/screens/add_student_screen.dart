import 'package:final_marks_manager/providers/class_operation_provider.dart';
import 'package:final_marks_manager/providers/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddStudentScreen extends StatefulWidget {
  static const routName = 'Add-Student-Screen';
  const AddStudentScreen({Key? key}) : super(key: key);

  @override
  State<AddStudentScreen> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudentScreen> {
  void addData() {
    final studentProvider = Provider.of<Student>(context, listen: false);
    final classProvider = Provider.of<ClassOperation>(context, listen: false);

    final st = Student(
        name: nameController.text,
        sheetno: sheetNumberController.text,
        grno: grNumberController.text);
    studentProvider.addStudent(st, classProvider.selectedClass);
  }

  final nameController = TextEditingController();
  final grNumberController = TextEditingController();
  final sheetNumberController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    grNumberController.dispose();
    sheetNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Name'),
          controller: nameController,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Gr Number'),
          controller: grNumberController,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Sheet Number'),
          controller: sheetNumberController,
        ),
        RaisedButton(
          onPressed: () {
            addData();
            setState(() {
              nameController.text = '';
              grNumberController.text = '';
              sheetNumberController.text = '';
            });
          },
          child: Text('Add Student'),
        )
      ],
    );
  }
}
