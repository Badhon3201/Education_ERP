import 'dart:async';

import 'package:flutter/material.dart';
import 'package:student_management_system/feature_app/Auth/view/login_screen.dart';
import 'package:student_management_system/feature_app/dashboard/view/dashboard_page.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  void initState() {
    // TODO: implement initState
    _loadWidget();
    super.initState();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.deepPurple,
            Colors.purple,
            Colors.deepPurple,
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/projonmosoft_logo.png',
              width: width * 0.6,
              fit: BoxFit.contain,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Ultimate Education ERP',
                style: TextStyle(
                    color: Colors.white, fontSize: 18, letterSpacing: 1.4),
              ),
            )
          ],
        ),
      ),
      // body: Center(
      //     child: InkWell(
      //         onTap: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => DashboardPage()));
      //         },
      //         child: Text('Login'))),
    );
  }
}
