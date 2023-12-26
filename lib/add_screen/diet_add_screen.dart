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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleTextFieldWidget(),
            // imagePickerWidget(),
            // bodyTextFieldWidget(),
          ],
        ),
      )
    );
  }

  Widget titleTextFieldWidget() {
    return Expanded(
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1.0
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1.0
            )
          ),
          hintText: '00/00 00시',
        ),
      )
    );
  }
}
