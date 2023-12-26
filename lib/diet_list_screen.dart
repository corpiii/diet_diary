import 'package:flutter/material.dart';

class DietListScreen extends StatelessWidget {
  const DietListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('식단 리스트'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.deepPurple,
                width: 200,
                height: 70,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.deepPurple,
                width: 200,
                height: 70,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.deepPurple,
                width: 200,
                height: 70,
              ),
            ),
          ],
        ),
      )
    );
  }
}
