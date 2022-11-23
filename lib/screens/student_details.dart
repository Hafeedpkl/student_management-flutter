import 'package:flutter/material.dart';
import 'package:student_details/screens/edit_student.dart';

class StudentDetails extends StatelessWidget {
  final String name;
  final String age;
  final String place;
  final String phone;
  final int index;

  const StudentDetails({
    super.key,
    required this.name,
    required this.age,
    required this.place,
    required this.phone,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SafeArea(
          child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'Student Full Details',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/avatar.jpg')),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Name: $name",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Age: $age",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Place: $place",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "phone: $phone",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditStudent(
                      name: name,
                      age: age,
                      place: place,
                      phone: phone,
                      index: index),
                ));
              },
              label: const Text('Edit'))
        ],
      )),
    );
  }
}
