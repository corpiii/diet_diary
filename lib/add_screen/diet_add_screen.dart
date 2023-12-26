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
        leading: const CloseButton(
          color: Colors.blue,
        ),
        title: const Text('추가'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              '완료',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.deepPurple,
        width: 100,
        height: 100,
      ),
    );
  }
}
