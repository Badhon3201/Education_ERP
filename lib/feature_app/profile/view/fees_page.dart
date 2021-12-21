import 'package:flutter/material.dart';

class FeesPage extends StatefulWidget {
  const FeesPage({Key? key}) : super(key: key);

  @override
  _FeesPageState createState() => _FeesPageState();
}

class _FeesPageState extends State<FeesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fees'),
      ),
    );
  }
}
