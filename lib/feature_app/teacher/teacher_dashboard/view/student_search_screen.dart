import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:student_management_system/feature_app/teacher/teacher_dashboard/repository/class_list_repository.dart';
import 'package:student_management_system/feature_app/teacher/teacher_dashboard/repository/student_search_repository.dart';
import 'package:student_management_system/feature_app/teacher/teacher_dashboard/view/student_list.dart';

class StudentSearchScreen extends StatefulWidget {
  const StudentSearchScreen({Key? key}) : super(key: key);

  @override
  _StudentSearchScreenState createState() => _StudentSearchScreenState();
}

class _StudentSearchScreenState extends State<StudentSearchScreen> {
  String? classValue = '1';
  String? secValue = '1';
  String? groupValue = '1';
  @override
  void initState() {
    // TODO: implement initState
    ClassListRepository().fetchClasses();
    super.initState();
  }

  @override
  List<ClassList> classList2 = [];
  List<ClassList> classList = [
    ClassList(name: 'Six', id: 1),
    ClassList(name: 'Seven', id: 2),
    ClassList(name: 'Eight', id: 3),
    ClassList(name: 'Nine', id: 4),
    ClassList(name: 'Ten', id: 5),
    ClassList(name: 'Ten Old', id: 6),
  ];
  List<ClassList> groupList = [
    ClassList(name: 'Science', id: 1),
    ClassList(name: 'Arts', id: 2),
    ClassList(name: 'Commerce', id: 3),
  ];
  List<ClassList> sectionList = [
    ClassList(name: 'A', id: 1),
    ClassList(name: 'B', id: 2),
    ClassList(name: 'C', id: 3),
    ClassList(name: 'D', id: 4),
    ClassList(name: 'E', id: 5),
    ClassList(name: 'F', id: 6),
  ];
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Student Search'),
        toolbarHeight: 60,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 40, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Column(children: [
                Container(
                    height: 45,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38)),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            value: classValue,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                classValue = newValue!;
                                print(newValue);
                              });
                            },
                            items: classList
                                .map((e) => DropdownMenuItem<String>(
                                      value: e.id.toString(),
                                      child: Row(
                                        children: [Text(e.name.toString())],
                                      ),
                                    ))
                                .toList()))),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    height: 45,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38)),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            value: secValue,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                secValue = newValue!;
                                print(newValue);
                              });
                            },
                            items: sectionList
                                .map((e) => DropdownMenuItem<String>(
                                      value: e.id.toString(),
                                      child: Row(
                                        children: [Text(e.name.toString())],
                                      ),
                                    ))
                                .toList()))),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    height: 45,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38)),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            value: groupValue,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                groupValue = newValue!;
                                print(groupValue);
                              });
                            },
                            items: groupList
                                .map((e) => DropdownMenuItem<String>(
                                      value: e.id.toString(),
                                      child: Row(
                                        children: [Text(e.name.toString())],
                                      ),
                                    ))
                                .toList()))),
              ]),
            ),
            Container(
              height: 45,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  await StudentListRepository().fetchData(
                      classes: classValue,
                      section: secValue,
                      group: groupValue);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => StudentListScreen()));
                },
                child: const Text('Search'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClassList {
  int? id;
  String? name;
  ClassList({this.id, this.name});
}
