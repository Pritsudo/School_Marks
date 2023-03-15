// import 'package:final_marks_manager/providers/class_operation_provider.dart';
// import 'package:final_marks_manager/providers/student_provider.dart';
import 'package:final_marks_manager/widgets/create_class_widget.dart';
import 'package:final_marks_manager/widgets/class_select_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateSelectClassScreen extends StatefulWidget {
  static const routName = 'Create-select-screen';
  const CreateSelectClassScreen({Key? key}) : super(key: key);

  @override
  State<CreateSelectClassScreen> createState() =>_CreateSelectClassScreenState();
}

class _CreateSelectClassScreenState extends State<CreateSelectClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Class'),
      ),
      body: 
         Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              const CreateClass(),
              const SizedBox(
                height: 25,
              ),
              const ClassSelect(),
            ],
          ),
        ),
      
    );
  }
}
