// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:student_details/function/db_function.dart';
import 'package:student_details/screens/ScreenStudentAdd.dart';
import 'package:student_details/screens/searchStudent.dart';
import 'package:student_details/screens/student_details.dart';

import '../model/data_model.dart';

class ScreenStudentList extends StatefulWidget {
  const ScreenStudentList({
    super.key,
  });

  @override
  State<ScreenStudentList> createState() => _ScreenStudentListState();
}

class _ScreenStudentListState extends State<ScreenStudentList> {
  @override
  void initState() {
    super.initState();
    getAllStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const ScreenStudentAdd())));
        },
      ),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: studentListNoitfier,
        builder:
            (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
          return Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              studentList.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemBuilder: (ctx, index) {
                          final data = studentList[index];
                          // var enc = data.photo;
                          // final img = const Base64Decoder().convert(enc.toString());
                          return Card(
                            color: Colors.blue[100],
                            child: ListTile(
                              leading: const CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/images/avatar.jpg')
                                  // MemoryImage(img),
                                  ),
                              title: Text(data.name),
                              subtitle: Text('${data.age} Years Old'),
                              trailing: IconButton(
                                onPressed: () {
                                  deleteStudent(index);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => StudentDetails(
                                            name: data.name,
                                            age: data.age,
                                            place: data.place,
                                            phone: data.phone,
                                            index: index))));
                              },
                            ),
                          );
                        },
                        itemCount: studentList.length,
                      ),
                    )
                  : const Center(child: Text("No Details Found")),
            ],
          );
        },
      )),
    );
  }
}
