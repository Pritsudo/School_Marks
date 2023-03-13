import 'package:final_marks_manager/providers/test_subject_select_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestSelectWidget extends StatelessWidget {
  const TestSelectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tests = [
      'Test1',
      'Test2',
      'Test3',
      'AnnualTest',
    ];
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
              'Select Test',
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
                                  value.setTest(tests[index]);
                                },
                                child: ListTile(
                                  title: Text(tests[index],
                                      style: TextStyle(fontSize: 18)),
                                  trailing: value.test == tests[index]
                                      ? Icon(Icons.favorite_outline)
                                      : Icon(Icons.face),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      itemCount: tests.length,
                    ))),
          ],
        ),
      ),
    );
  }
}
