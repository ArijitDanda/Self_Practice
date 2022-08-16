import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_work/All_About_Api/Api_integration.dart';
import 'package:self_work/Api_practice_11-08-2022/homepage.dart';
import 'package:self_work/Api_practice_11-08-2022/logpage.dart';
import 'package:self_work/Api_practice_11-08-2022/todosmoddeldata.dart';

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
      home:  const Todosdata(),
      debugShowCheckedModeBanner: false,
    );
  }
}
