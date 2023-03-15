import 'package:final_marks_manager/providers/select_page_provider.dart';
import 'package:final_marks_manager/screens/add_student_screen.dart';
import 'package:final_marks_manager/screens/student_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentScreensNavigation extends StatelessWidget {
  static const routName = 'Student-Screen-Navigation';
  const StudentScreensNavigation({ Key? key }) : super(key: key);

static const List<Widget> _widgetOptions = <Widget>[  
  AddStudentScreen(),
  StudentListScreen()
  ];  

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SelectPage>(context);
    final _selectedIndex = provider.selectedPage;
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('Select Screen'),  
      ),  
      body: Center(  
        child: _widgetOptions.elementAt(_selectedIndex),  
      ),  
      bottomNavigationBar: BottomNavigationBar(  
        items: const <BottomNavigationBarItem>[  
          BottomNavigationBarItem(  
            icon: Icon(Icons.add),  
            label: 'Add Student',  
            backgroundColor: Colors.blue  
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.child_care),  
            label: 'Student List',  
            backgroundColor: Colors.yellow  
          ),  
         
        ],  
        type: BottomNavigationBarType.shifting,  
        currentIndex: _selectedIndex,  
        selectedItemColor: Colors.black,  
        iconSize: 40,  
        onTap: provider.setPageNumber,  
        elevation: 5  
      ),  
    );  
  }  
}