import 'package:flutter/material.dart';
import 'package:get/get.dart';

class practicegetx extends StatefulWidget {
  @override
  State<practicegetx> createState() => _practicegetxState();
}

class _practicegetxState extends State<practicegetx> {
  Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practicex'),
      ),
      body: Center(
          child: Obx((() => Text(
                'The value is:  ${c.count}',
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent),
              )))),
      //  GetBuilder<Controller>(
      //   builder: (_) {
      //     return Text('${c.count}');
      //   },
      // ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              c.up(true);
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              c.up(false);
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class Controller extends GetxController {
  var count = 0.obs;
  bool check = true;
  void up(check) {
    if (check == true) {
      count++;
    } else {
      count--;
    }
    // update();
  }
}
