import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';
import 'package:student_management_system/feature_app/Auth/repository/login_repository.dart';
import 'package:student_management_system/feature_app/Auth/view_model/sign_in_view_model.dart';
import 'package:student_management_system/feature_app/dashboard/view/dashboard_page.dart';
import 'package:student_management_system/main_app/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedIndex = 'Student';
  bool isValidte = true;
  var list = ['Student', 'Teacher', 'Admin'];
  final _formKey = new GlobalKey<FormState>();
  String? validatePassword(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return "Password should contain more than 5 characters";
    }
    return null;
  }

  String? nullFieldValidate(String value) =>
      value.trim().isEmpty ? 'This Field is required' : null;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SignInViewModel>(context, listen: false);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                          Image.asset(
                            'assets/images/projonmosoft_logo.png',
                            width: width * 0.55,
                            fit: BoxFit.contain,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
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
      ),
    );
  }

  Widget studentLoginForm() {
    var vm = Provider.of<SignInViewModel>(context, listen: false);
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
                controller: usernameController,
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
                controller: passwordController,
                // validator: (value) =>
                //     value!.isEmpty ? 'Password field is required' : null,
                decoration: const InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password *',
                    focusColor: Colors.grey,
                    // errorText: 'This Field is required',
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
                    //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
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
                onPressed: () async {
                  print('sdsd');
                  if (_formKey.currentState!.validate()) {
                    await vm.getSignInData(
                        username: usernameController.text,
                        password: passwordController.text);

                    if (vm.accessToken != null) {
                      isValidte = true;
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (BuildContext context) => DashboardPage(),
                          ),
                          (Route<dynamic> route) => false);
                    } else {
                      setState(() {
                        isValidte = false;
                      });
                    }
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => DashboardPage()));
                  }
                },
                child: const Text('Login'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            isValidte
                ? SizedBox()
                : Center(
                    child: Container(
                        color: Colors.red,
                        width: MediaQuery.of(context).size.width * .5,
                        child: Center(
                            child: Text(
                          'Invalid username or password',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ))),
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
