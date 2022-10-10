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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                'TIC TAC GAME',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
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
                            style: const TextStyle(
                                color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohturn && displayoh[index] == '') {
        displayoh[index] = '0';
      } else if (!ohturn && displayoh[index] == '') {
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
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Winner'),
          actions: [
            TextButton(
                onPressed: () {
                  playagain();
                  Navigator.of(context).pop();
                },
                child: const Text('Play Again'))
          ],
        );
      },
    );
  }

  playagain() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayoh[i] = '';
      }
    });
  }
}
