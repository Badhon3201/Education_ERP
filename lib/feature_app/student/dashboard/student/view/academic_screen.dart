import 'package:flutter/material.dart';

class AcamedicScreen extends StatefulWidget {
  const AcamedicScreen({Key? key}) : super(key: key);

  @override
  _AcamedicScreenState createState() => _AcamedicScreenState();
}

class _AcamedicScreenState extends State<AcamedicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academic'),
      ),
    );
  }
}
