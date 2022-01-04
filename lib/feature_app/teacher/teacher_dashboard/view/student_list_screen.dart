import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:student_management_system/feature_app/teacher/teacher_dashboard/view_model/student_list_view_model.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      // await Provider.of<StudentListViewModel>(context, listen: false)
      //     .getStudentData();
      print(
          "Akram${Provider.of<StudentListViewModel>(context, listen: false).studentList.length}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var studenVM = Provider.of<StudentListViewModel>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Student List'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        // physics: const AlwaysScrollableScrollPhysics(),
        itemCount: studenVM.studentList.length,
        itemBuilder: (context, int index) {
          return Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Image.asset(
                        'assets/images/projonmosoft_logo.png',
                        width: width * 0.55,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${studenVM.studentList[index].name}'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Class : ${studenVM.studentList[index].studentListModelClass} | Section : ${studenVM.studentList[index].section} |',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
