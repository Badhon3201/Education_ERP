import 'package:flutter/material.dart';

class FeesListWidget extends StatefulWidget {
  FeesListWidget(
      {required this.feesTitle,
      required this.classes,
      required this.status,
      required this.amount,
      required this.dueDate,
      required this.section,
      required this.feesHead,
      required this.paymentDate,
      required this.paymentMethod,
      required this.student});
  final String? feesHead;
  final String? classes;
  final String? section;
  final String? feesTitle;
  final String? status;
  final String? paymentMethod;
  final String? amount;
  final String? dueDate;
  final String? paymentDate;
  final String? student;
  @override
  _FeesListWidgetState createState() => _FeesListWidgetState();
}

class _FeesListWidgetState extends State<FeesListWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${widget.feesHead}',
            style: TextStyle(fontSize: 19),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Fees Title:'),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${widget.feesTitle}'),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * 0.47,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Classes:'),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${widget.classes}'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width * 0.47,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Section:'),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${widget.section}'),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * 0.47,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Status:'),
                    const SizedBox(
                      width: 20,
                    ),
                    Text('${widget.status}'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width * 0.47,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Amount:'),
                    const SizedBox(
                      width: 20,
                    ),
                    Text('${widget.amount}'),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * 0.47,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Due Date: '),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${widget.dueDate}'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width * 0.47,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Payment Date: '),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${widget.paymentDate}'),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * 0.47,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Payment Method:'),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${widget.paymentMethod}'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width * 0.47,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Student: '),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${widget.student}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
