// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_details/function/db_function.dart';
import 'package:student_details/screens/ScreenStudentList.dart';

import '../model/data_model.dart';

class ScreenStudentAdd extends StatefulWidget {
  const ScreenStudentAdd({super.key});

  @override
  State<ScreenStudentAdd> createState() => _ScreenStudentAddState();
}

class _ScreenStudentAddState extends State<ScreenStudentAdd> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _placeController = TextEditingController();

  // bool imageAlert = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('New Student')),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // _photo?.path == null?
                  const CircleAvatar(
                    radius: .80,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  // : CircleAvatar(
                  //     backgroundImage: FileImage(File(
                  //       _photo!.path,
                  //     )),
                  //     radius: 80,
                  //   ),
                  // ElevatedButton.icon(
                  //   onPressed: () {
                  //     getPhoto();
                  //   },
                  //   icon: const Icon(Icons.add_photo_alternate_outlined),
                  //   label: const Text('Photo'),
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.white,
                  //     foregroundColor: Colors.black,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Name',
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name Required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _ageController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Age',
                        labelText: 'Age'),
                    validator: (
                      value,
                    ) {
                      if (value == null || value.isEmpty) {
                        return 'Age Requied';
                      } else if (value.length > 3) {
                        return 'Enter Correct Age';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _placeController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Place',
                        labelText: 'Place'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'place Required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Phone Number',
                        labelText: 'phone'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Phone Number';
                      } else if (value.length != 10) {
                        return 'Require valid Phone Number';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              onStudentButtonClicked();
                            }
                          },
                          icon: const Icon(Icons.done),
                          label: const Text('Add'))
                    ],
                  )
                ],
              ),
            ),
          ),
        )));
  }

  Future<void> onStudentButtonClicked() async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final place = _placeController.text.trim();
    final phone = _phoneController.text.trim();
    if (name.isEmpty || age.isEmpty || place.isEmpty || phone.isEmpty
        // ||
        // _photo!.path.isEmpty
        ) {
      return;
    }

    final student = StudentModel(
      name: name,
      age: age,
      place: place,
      phone: phone,
      // photo: _photo!.path
    );

    addStudent(student);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ScreenStudentList(),
    ));
  }

  File? _photo;

  Future<void> getPhoto() async {
    final photo = ImagePicker().pickImage(source: ImageSource.gallery);
    // ignore: unnecessary_null_comparison
    if (photo == null) {
      return;
    } else {
      final photoTemp = File(_photo!.path);
      setState(() {
        _photo = photoTemp;
      });
    }
  }
}
