import 'package:flutter/material.dart';
import 'package:student_details/function/db_function.dart';
import 'package:student_details/screens/ScreenStudentList.dart';

import '../model/data_model.dart';

class EditStudent extends StatefulWidget {
  final String name;
  final String age;
  final String place;
  final String phone;
  final int index;
  const EditStudent(
      {super.key,
      required this.name,
      required this.age,
      required this.place,
      required this.phone,
      required this.index});

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _placeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _ageController = TextEditingController(text: widget.age);
    _placeController = TextEditingController(text: widget.place);
    _phoneController = TextEditingController(text: widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
      ),
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
                  radius: 80,
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
                            onEditSaveButton(context);
                          }
                        },
                        icon: const Icon(Icons.edit_rounded),
                        label: const Text('done'))
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future<void> onEditSaveButton(ctx) async {
    final studentmodel = StudentModel(
        name: _nameController.text,
        age: _ageController.text,
        place: _placeController.text,
        phone: _phoneController.text);
    editList(widget.index, studentmodel);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ScreenStudentList(),
      ),
    );
  }
}
