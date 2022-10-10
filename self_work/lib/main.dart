import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_work/MapImplement/googlemap.dart';
import 'package:self_work/MapImplement/googlemaptry.dart';
import 'package:self_work/tictacgame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // showPerformanceOverlay: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const GoogleMAptry(),
      debugShowCheckedModeBanner: false,
    );
  }
}
