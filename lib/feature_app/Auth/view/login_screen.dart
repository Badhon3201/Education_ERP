import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedIndex = 'Student';
  var list = ['Student', 'Teacher', 'Admin'];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipperTwo(
                    flip: true,
                  ),
                  child: Container(
                    width: width,
                    height: height * 0.55,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    width: width,
                    height: height * 0.545,
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
                      children: <Widget>[
                        // Text(
                        //   'ProjonmoSoft',
                        //   style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 35,
                        //       fontWeight: FontWeight.bold),
                        // ),
                        Image.asset(
                          'assets/images/projonmosoft_logo.png',
                          width: width * 0.55,
                          fit: BoxFit.contain,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Ultimate Education ERP',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1.4),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.4,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   height: 40,
                  //   width: width,
                  //   margin: EdgeInsets.only(left: 10, right: 10),
                  //   decoration: BoxDecoration(
                  //       color: Colors.purple,
                  //       borderRadius: BorderRadius.circular(5)),
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: list.length,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return InkWell(
                  //           onTap: () {
                  //             selectedIndex = list[index];
                  //             setState(() {});
                  //           },
                  //           child: Container(
                  //             height: 40,
                  //             width: width * .315,
                  //             decoration: BoxDecoration(
                  //                 border: Border.all(color: Colors.grey),
                  //                 color: Colors.purple,
                  //                 borderRadius: BorderRadius.circular(5)),
                  //             child: Center(
                  //                 child: Text(
                  //               list[index],
                  //               style: TextStyle(color: Colors.white),
                  //             )),
                  //           ),
                  //         );
                  //       }),
                  // ),
                  selectedIndex == 'Student'
                      ? studentLoginForm()
                      : selectedIndex == 'Teacher'
                          ? teacherLoginForm()
                          : adminLoginForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget studentLoginForm() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            SizedBox(
              height: 50,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email *',
                    focusColor: Colors.grey,
                    labelStyle: TextStyle(color: Colors.deepPurple),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    )),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 50,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password *',
                    focusColor: Colors.grey,
                    labelStyle: TextStyle(color: Colors.deepPurple),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    )),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline_sharp,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Remember Me',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Text(
                  'Forgote Password ?',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            SizedBox(height: 15),
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
                onPressed: () {},
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget teacherLoginForm() {
    return SizedBox(
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'What do people call you?',
              labelText: 'Name *',
            ),
          )
          // onSaved: (String value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
          // },
          // validator: (String value) {
          // return value.contains('@') ? 'Do not use the @ char.' : null;
          // },
          // )
        ],
      ),
    );
  }

  Widget adminLoginForm() {
    return SizedBox(
      child: Text('Aaaaaaa'),
    );
  }
}
