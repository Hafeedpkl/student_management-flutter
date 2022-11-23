import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNoitfier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  // print(value.toString());

  final studentDB = await Hive.openBox<StudentModel>('student_db');

  final id = await studentDB.add(value);
  value.id = id;
  // studentListNoitfier.value.add(value);

  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  studentListNoitfier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNoitfier.value.clear();
  studentListNoitfier.value.addAll(studentDB.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  studentListNoitfier.notifyListeners();
}

Future<void> deleteStudent(index) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.deleteAt(index);
  getAllStudents();
}

Future<void> editList(int id, StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.putAt(id, value);
  getAllStudents();
}
