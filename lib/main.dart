import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_details/model/data_model.dart';
import 'package:student_details/screens/ScreenStudentList.dart';

Future<void> main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Details',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const ScreenStudentList(),
    );
  }
}
