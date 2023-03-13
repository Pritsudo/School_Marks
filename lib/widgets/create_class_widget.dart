import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/class_operation_provider.dart';

class CreateClass extends StatefulWidget {
  const CreateClass({Key? key}) : super(key: key);

  @override
  State<CreateClass> createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  @override
  final classController = TextEditingController();

  void dispose() {
    classController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClassOperation>(context, listen: false);

    return Container(
      height: 200,
      width: 370,
      child: Card(
        color: Colors.blue[200],
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            const Text(
              'Add Class',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorHeight: 24,
                decoration: InputDecoration(
                    labelText: 'New Class', hintText: 'Enter new class'),
                controller: classController,
              ),
            ),
            Center(
                child: IconButton(
                    onPressed: () {
                      classController.text.trim();
                      provider.addNewClass(classController.text);
                      classController.text = '';
                    },
                    icon: Icon(
                      Icons.add,
                      size: 30,
                    ))),
          ],
        ),
      ),
    );
  }
}
