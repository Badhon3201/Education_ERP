import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:student_management_system/feature_app/student/profile/view/widgets/fees_details_widgets.dart';
import 'package:student_management_system/feature_app/student/profile/view_model/fees_list_view_model.dart';

class FeesPage extends StatefulWidget {
  const FeesPage({Key? key}) : super(key: key);

  @override
  _FeesPageState createState() => _FeesPageState();
}

class _FeesPageState extends State<FeesPage> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      await Provider.of<StudentFeesViewModel>(context, listen: false)
          .getProfileData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var feesVM = Provider.of<StudentFeesViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Fees'),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: height * 0.15,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Grand Total',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[300]),
                ),
              ),
            ),
            ListView.builder(
                itemCount: feesVM.fees.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return SizedBox(
                    height: 120,
                    width: width,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${feesVM.fees[index].feeHead}',
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.blue[400],
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (builder) {
                                        return Container(
                                          height: 200,
                                          color: Colors.black38,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20))),
                                            child: FeesListWidget(
                                              student:
                                                  feesVM.fees[index].student,
                                              feesTitle:
                                                  feesVM.fees[index].feeTitle,
                                              feesHead:
                                                  feesVM.fees[index].feeHead,
                                              amount: feesVM.fees[index].amount
                                                  .toString(),
                                              classes:
                                                  feesVM.fees[index].classes,
                                              dueDate:
                                                  feesVM.fees[index].dueDate,
                                              paymentDate: feesVM
                                                  .fees[index].paymentDate
                                                  .toString(),
                                              paymentMethod: feesVM
                                                  .fees[index].paymentMethod,
                                              section:
                                                  feesVM.fees[index].section,
                                              status: feesVM.fees[index].status,
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Text(
                                  'View',
                                  style: TextStyle(
                                    fontSize: 19,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple[500],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Due Date',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('${feesVM.fees[index].dueDate}'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amount',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('৳ ${feesVM.fees[index].amount}'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Paid',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                feesVM.fees[index].status == 'Paid'
                                    ? Text('৳ ${feesVM.fees[index].amount}')
                                    : Text('0'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Balance',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('৳ ${feesVM.fees[index].amount}'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Status',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 20,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: feesVM.fees[index].status == 'Paid'
                                        ? Colors.green
                                        : Colors.yellow,
                                  ),
                                  child: Center(
                                      child: Text(
                                    "${feesVM.fees[index].status}",
                                    style: const TextStyle(color: Colors.white),
                                  )),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          thickness: 1,
                        )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
