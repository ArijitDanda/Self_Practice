import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_work/Practice_Work.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const PracticeWork(),
      debugShowCheckedModeBanner: false,
    );
  }
}
