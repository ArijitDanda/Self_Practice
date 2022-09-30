import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Tictacgame extends StatefulWidget {
  const Tictacgame({super.key});

  @override
  State<Tictacgame> createState() => _TictacgameState();
}

class _TictacgameState extends State<Tictacgame> {
  bool ohturn = true;
  List<String> displayoh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: GridView.builder(
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _tapped(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.grey[700],
              ),
              child: Center(
                child: Text(
                  displayoh[index],
                  style: const TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohturn) {
        displayoh[index] = '0';
      } else {
        displayoh[index] = 'x';
      }
      ohturn = !ohturn;
      checkwiner();
    });
  }

  void checkwiner() {
    ////row//////
    if (displayoh[0] == displayoh[1] &&
        displayoh[0] == displayoh[2] &&
        displayoh[0] != '') {
      showwindialog();
    }
    if (displayoh[3] == displayoh[4] &&
        displayoh[3] == displayoh[5] &&
        displayoh[3] != '') {
      showwindialog();
    }
    if (displayoh[6] == displayoh[7] &&
        displayoh[6] == displayoh[8] &&
        displayoh[6] != '') {
      showwindialog();
    }

    ///column/////
    if (displayoh[0] == displayoh[3] &&
        displayoh[0] == displayoh[6] &&
        displayoh[0] != '') {
      showwindialog();
    }
    if (displayoh[2] == displayoh[5] &&
        displayoh[2] == displayoh[8] &&
        displayoh[2] != '') {
      showwindialog();
    }
    if (displayoh[1] == displayoh[4] &&
        displayoh[1] == displayoh[7] &&
        displayoh[1] != '') {
      showwindialog();
    }

    ///diagonal//////
    if (displayoh[6] == displayoh[4] &&
        displayoh[6] == displayoh[2] &&
        displayoh[6] != '') {
      showwindialog();
    }
    if (displayoh[0] == displayoh[4] &&
        displayoh[0] == displayoh[8] &&
        displayoh[0] != '') {
      showwindialog();
    }
  }

  void showwindialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Winner'),
        );
      },
    );
  }
}
