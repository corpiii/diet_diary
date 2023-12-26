import 'package:flutter/material.dart';

class DietAddScreen extends StatefulWidget {
  const DietAddScreen({super.key});

  @override
  State<DietAddScreen> createState() => _DietAddScreenState();
}

class _DietAddScreenState extends State<DietAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(
          color: Colors.blue,
        ),
        title: Text('fe'),
      ),
      body: Container(
        color: Colors.deepPurple,
        width: 100,
        height: 100,
      ),
    );
  }
}
