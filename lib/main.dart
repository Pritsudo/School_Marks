import 'package:final_marks_manager/providers/class_operation_provider.dart';
import 'package:final_marks_manager/providers/marks_operation_provider.dart';
import 'package:final_marks_manager/providers/select_page_provider.dart';
import 'package:final_marks_manager/providers/student_provider.dart';
import 'package:final_marks_manager/providers/test_subject_select_provider.dart';
import 'package:final_marks_manager/screens/add_student_screen.dart';
import 'package:final_marks_manager/screens/create_select_class_screen.dart';
import 'package:final_marks_manager/screens/student_screens_navigation.dart';
import 'package:final_marks_manager/screens/test_subject_select_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>  ClassOperation()),
        ChangeNotifierProvider(create: (_) =>  Student(grno: "",name: "",sheetno: "")),
         ChangeNotifierProvider(create: (_) =>  TestSubjectSelect()),
         ChangeNotifierProvider(create: (_) =>  SelectPage()),
         ChangeNotifierProvider(create: (_) =>  MarksOperation()),

      ],
      child: MaterialApp(
        title: 'School',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CreateSelectClassScreen(),
        routes: 
        {
          CreateSelectClassScreen.routName :(context)=>CreateSelectClassScreen(),
          TestSubjectSelectScreen.routName :(context)=>TestSubjectSelectScreen(),
          AddStudentScreen.routName :(context)=>AddStudentScreen(),
          StudentScreensNavigation.routName :(context)=>StudentScreensNavigation(),
        }
      ),
      
    );
    
  }
}


