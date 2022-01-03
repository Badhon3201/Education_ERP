import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_system/feature_app/student/profile/view_model/profile_get_all_data_view_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selectedIndex = 'Personal';
  var list = ['Personal', 'Parents', 'Transport', 'Others'];
  @override
  Widget build(BuildContext context) {
    var profileVM =
        Provider.of<StudentProfileDataViewModel>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Profile'),
        toolbarHeight: 60,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.16,
              width: width,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${profileVM.studentProfileModel?.name ?? ""}',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Class : ${profileVM.studentProfileModel?.classes ?? ""} | Section : ${profileVM.studentProfileModel?.section ?? ''}',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Roll : ${profileVM.studentProfileModel?.roll ?? ''} | Adm : 59260',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.7,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: width,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                selectedIndex = list[index];
                                setState(() {});
                              },
                              child: Container(
                                height: 40,
                                width: width * .238,
                                decoration: BoxDecoration(
                                    color: selectedIndex == list[index]
                                        ? Colors.white
                                        : Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                        child: Text(
                                      list[index],
                                    )),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    selectedIndex == 'Personal'
                        ? personalWidget()
                        : selectedIndex == 'Parents'
                            ? parentWidget()
                            : selectedIndex == 'Transport'
                                ? transportWidget()
                                : otherWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget personalWidget() {
    var profileVM =
        Provider.of<StudentProfileDataViewModel>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var sizedBox = const SizedBox(
      height: 15,
    );

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Date of Birth',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${profileVM.studentProfileModel?.dateOfBirth ?? 'Not Provided'}',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Religion',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${profileVM.studentProfileModel?.dateOfBirth ?? 'Not Provided'}',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Phone Number',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${profileVM.studentProfileModel?.phone == null ? profileVM.studentProfileModel?.phone : 'Not Provided'}',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Email Address',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${profileVM.studentProfileModel?.email == null ? profileVM.studentProfileModel?.email : 'Not Provided'}',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Present Address',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${profileVM.studentProfileModel?.presentAddress == null ? profileVM.studentProfileModel?.presentAddress : 'Not Provided'}',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Permanent Address',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${profileVM.studentProfileModel?.presentAddress == null ? profileVM.studentProfileModel?.presentAddress : 'Not Provided'}',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Father's name",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${profileVM.studentProfileModel?.fatherName == null ? profileVM.studentProfileModel?.fatherName : 'Not Provided'}',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Mother's name",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${profileVM.studentProfileModel?.motherName == null ? profileVM.studentProfileModel?.motherName : 'Not Provided'}',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Blood group",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${profileVM.studentProfileModel?.bloodGroup ?? 'Not Provided'}',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget parentWidget() {
    var profileVM =
        Provider.of<StudentProfileDataViewModel>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var sizedBox = const SizedBox(
      height: 15,
    );

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width * 0.4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Father's name",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.45,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${profileVM.studentProfileModel?.fatherName == null ? profileVM.studentProfileModel?.fatherName : 'Not Provided'}',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
          sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width * 0.4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Father's phone",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.45,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${profileVM.studentProfileModel?.fatherPhone == null ? profileVM.studentProfileModel?.fatherPhone : 'Not Provided'}',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
          sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width * 0.4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Father's occupation",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.45,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${profileVM.studentProfileModel?.fatherPhone == null ? profileVM.studentProfileModel?.fatherPhone : "Not Provided"}',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
          sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width * 0.4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Mother's name",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.45,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${profileVM.studentProfileModel?.fatherName == null ? profileVM.studentProfileModel?.fatherName : 'Not Provided'}',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
          sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width * 0.4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Present Address',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.45,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Mirpur-2',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
          sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width * 0.4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Mother's phone",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.45,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${profileVM.studentProfileModel?.fatherPhone == null ? profileVM.studentProfileModel?.motherPhone : "Not Provided"}',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
          sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width * 0.4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Mother's occupation",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.45,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${profileVM.studentProfileModel?.motherOccupation ?? "Not Provided"}',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
          sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width * 0.4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Guardians name",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.45,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${profileVM.studentProfileModel?.guardianName == null ? profileVM.studentProfileModel?.guardianName : "Not Provided"}',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
          sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width * 0.4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Guardians occupation",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.45,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${profileVM.studentProfileModel?.guardianOccupation ?? "Not Provided"}',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
          sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width * 0.4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Guardians phone",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.45,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${profileVM.studentProfileModel?.guardianPhone == null ? profileVM.studentProfileModel?.guardianPhone : "Not Provided"}',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
          sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width * 0.4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Guardians relation",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.45,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${profileVM.studentProfileModel?.guardianPhone == null ? profileVM.studentProfileModel?.guardianPhone : "Not Provided"}',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget transportWidget() {
    var profileVM =
        Provider.of<StudentProfileDataViewModel>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var sizedBox = SizedBox(
      height: 15,
    );

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Driver name',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Aktar khan',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Car no',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'INFIX-1100',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Car model',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'INFIX-M1100',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Car info',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Architecto sit',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
          ],
        ),
      ),
    );
  }

  Widget otherWidget() {
    var profileVM =
        Provider.of<StudentProfileDataViewModel>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var sizedBox = SizedBox(
      height: 15,
    );

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Height',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '5.2',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '55',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Caste',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Asian',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'National Id',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '23454444500',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
          ],
        ),
      ),
    );
  }
}
