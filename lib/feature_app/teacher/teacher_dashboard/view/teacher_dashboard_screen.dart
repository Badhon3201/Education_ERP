import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:student_management_system/feature_app/Auth/view_model/access_token_view_model.dart';
import 'package:student_management_system/feature_app/student/dashboard/student/view/academic_screen.dart';
import 'package:student_management_system/feature_app/teacher/teacher_dashboard/view/student_search_screen.dart';

class TeacherDashboardScreen extends StatefulWidget {
  const TeacherDashboardScreen({Key? key}) : super(key: key);

  @override
  _TeacherDashboardScreenState createState() => _TeacherDashboardScreenState();
}

class _TeacherDashboardScreenState extends State<TeacherDashboardScreen> {
  int selectedIndex = 1;
  int selectedCard = -1;
  bool activeColor = false;
  Color color = Colors.white;
  List<EducationGridList> educationGridList = [
    EducationGridList(
        name: 'Students',
        icon: Icon(
          Icons.perm_identity_rounded,
          color: Colors.pink[300],
          size: 35,
        )),
    EducationGridList(
        name: 'Academic',
        icon: Icon(
          Icons.people_alt_sharp,
          color: Colors.pink[300],
          size: 35,
        )),
    EducationGridList(
        name: 'Attendance',
        icon: Icon(
          Icons.person_add_disabled_rounded,
          color: Colors.pink[300],
          size: 35,
        )),
    EducationGridList(
        name: 'Routine',
        icon: Icon(
          Icons.timer,
          color: Colors.pink[300],
          size: 35,
        )),
  ];
  final double itemHeight = (442 - kToolbarHeight - 24) / 3.5;
  final double itemWidth = 200 / 2;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      await Provider.of<AccessTokenProvider>(context, listen: false).getToken();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.16,
                decoration: const BoxDecoration(color: Colors.deepPurple),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Image.asset(
                          'assets/images/projonmosoft_logo.png',
                          width: width * 0.55,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: educationGridList.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200 / 2,
                          childAspectRatio: (itemWidth / itemHeight),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => index == 0
                                        ? StudentSearchScreen()
                                        : AcamedicScreen()));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => index == 0
                            //             ? const ProfilePage()
                            //             : index == 1
                            //                 ? const FeesPage()
                            //                 : index == 2
                            //                     ? const AttendancePage()
                            //                     : const RoutinePage()));
                            setState(() {
                              selectedCard = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 5, right: 5),
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  gradient: selectedCard == index
                                      ? const LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Colors.purple,
                                            Colors.deepPurple,
                                          ],
                                        )
                                      : const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                            Colors.white,
                                          ],
                                        ),
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  educationGridList[index].icon,
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    educationGridList[index].name,
                                    style: TextStyle(
                                        color: selectedCard == index
                                            ? Colors.white
                                            : Colors.grey[600]),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EducationGridList {
  Icon icon;
  String name;
  EducationGridList({required this.name, required this.icon});
}
