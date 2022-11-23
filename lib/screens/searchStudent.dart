// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:student_details/function/db_function.dart';
import 'package:student_details/screens/student_details.dart';

import '../model/data_model.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, query);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNoitfier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            if (data.name.toLowerCase().contains(query.toLowerCase())) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(ctx).push(
                        MaterialPageRoute(
                          builder: (context) => StudentDetails(
                            name: data.name,
                            age: data.age,
                            index: index,
                            place: data.place,
                            phone: data.phone,
                          ),
                        ),
                      );
                    },
                    title: Text(data.name),
                    leading: const CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/avatar.jpg')),
                  ),
                  const Divider(),
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: studentList.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNoitfier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            if (data.name.toLowerCase().contains(query.toLowerCase())) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(ctx).push(
                        MaterialPageRoute(
                          builder: (context) => StudentDetails(
                            age: data.age,
                            index: index,
                            name: data.name,
                            place: data.place,
                            phone: data.phone,
                          ),
                        ),
                      );
                    },
                    title: Text(data.name),
                    leading: const CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/avatar.jpg')),
                  ),
                  const Divider(),
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: studentList.length,
        );
      },
    );
  }
}
