import 'package:flutter/material.dart';

class DietListScreen extends StatelessWidget {
  const DietListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('식단 리스트'),
          actions: [
            iconButtonWidget(onPressed: () {}),
            const SizedBox(width: 10,)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
        ));
  }

  Widget iconButtonWidget({required void Function() onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: const Icon(
        Icons.add,
        color: Colors.blue,
        size: 30,
      ),
    );
  }
}