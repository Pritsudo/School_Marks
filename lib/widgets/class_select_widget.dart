import 'package:final_marks_manager/providers/class_operation_provider.dart';
import 'package:final_marks_manager/screens/test_subject_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassSelect extends StatefulWidget {
  const ClassSelect({Key? key}) : super(key: key);

  @override
  State<ClassSelect> createState() => _SelectClassState();
}

class _SelectClassState extends State<ClassSelect> {
  List<String> cls = [];
  @override
  void initState() {
    Provider.of<ClassOperation>(context, listen: false).fetchClasses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Methode Runned");
    return Container(
      height: 400,
      width: 370,
      child: Card(
        color: Colors.blue[200],
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            const Text(
              'Select Class',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 300,
                  child: Consumer<ClassOperation>(
                    builder: (_, value, child) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          var classValue = value.classes[index];
                          return Card(
                            elevation: 5,
                            child: InkWell(
                              onTap: () {
                                value.setClass(classValue);
                                Navigator.pushNamed(
                                    context, TestSubjectSelectScreen.routName);
                              },
                              child: ListTile(
                                title: Text(classValue,
                                    style: TextStyle(fontSize: 18)),
                                trailing: IconButton(
                                    onPressed: ()=>value.deleteClass(classValue) ,
                                    icon: Icon(Icons.delete)),
                              ),
                            ),
                          );
                        },
                        itemCount: value.classes.length,
                      );
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
