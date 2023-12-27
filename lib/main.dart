import 'package:diet_diary/diet_list_screen/diet_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import 'model/diet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DietListScreen(),
      title: '식단기록장',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}