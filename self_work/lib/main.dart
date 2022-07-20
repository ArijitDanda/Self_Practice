import 'package:flutter/material.dart';
import 'package:self_work/Allwork.dart';
import 'package:self_work/getpractice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: practicegetx(),
      debugShowCheckedModeBanner: false,
    );
  }
}
