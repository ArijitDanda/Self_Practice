import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PracticeWork extends StatefulWidget {
  const PracticeWork({super.key});

  @override
  State<PracticeWork> createState() => _PracticeWorkState();
}

class _PracticeWorkState extends State<PracticeWork> {
  TextEditingController textcontroller = TextEditingController();
  bool cash = false;
  bool epay = false;
  bool isloading = false;
  bool coupenchange = true;
  bool switchcheck = false;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purpleAccent,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: const Text('Practice'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.grey.shade200,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30.0,
                      offset: -Offset(-28, -28),
                      color: Colors.white,
                    ),
                    BoxShadow(
                        blurRadius: 30.0,
                        offset: -Offset(-28, -28),
                        color: Colors.grey.shade400)
                  ]),
            ),
            CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: const CircleBorder(),
                title: const Text('Cash'),
                value: cash,
                onChanged: (value) {
                  setState(() {
                    cash = value!;
                    epay = false;
                  });
                }),
            CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: const CircleBorder(),
                title: const Text('Epay'),
                value: epay,
                onChanged: (value1) {
                  setState(() {
                    epay = value1!;
                    cash = false;
                  });
                }),
            SwitchListTile(
                title: Text('jhgjh'),
                value: switchcheck,
                onChanged: (value1) {
                  switchcheck = value1;
                  setState(() {});
                }),
            ActionChip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.grey.shade800,
                    child: const Icon(Icons.add)),
                label: const Text('Add Memeber'),
                onPressed: () {
                  isloading = true;
                  showprogress();
                  // print(
                  //     'If you stand for nothing, Burr, what’ll you fall for?');
                }),
            /*  AspectRatio(
              This examples shows how AspectRatio sets width when its parent's width constraint is infinite. Since its parent's allowed height is a fixed value, the actual width is determined via the given AspectRatio.
      Since the height is fixed at 100.0 in this example and the aspect ratio is set to 16 / 9, the width should then be 100.0 / 9 * 16.
                aspectRatio: 2.0, */
            AspectRatio(
                aspectRatio: 2.2,
                child: ColorFiltered(
                  colorFilter:
                      const ColorFilter.mode(Colors.blue, BlendMode.colorBurn),
                  child: Image.network(
                      'https://images.unsplash.com/photo-1501854140801-50d01698950b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                )),
            Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please Enter the Coupon';
                    }
                    return null;
                  }),
                  controller: textcontroller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              print(textcontroller.text);
                              coupenchange = !coupenchange;
                              setState(() {});
                            }
                            if (coupenchange == true) {
                              textcontroller.clear();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Text(
                              coupenchange ? 'Apply' : 'Remove',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(25),
            //   child: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 15, sigmaY: 5),
            //     child: Container(
            //       height: 100,
            //       width: 250,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(25),
            //           color: Colors.purple),
            //       // child: glast,
            //     ),
            //   ),
            // ),
            FadeInImage.assetNetwork(
              width: 200,
              height: 200,
              placeholder: 'assets/cc.gif',
              fadeOutDuration: const Duration(seconds: 2),
              image:
                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
            ),
          ],
        ),
      ),
    );
  }

  showprogress() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.transparent,
            content: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.grey,
              child: CircularProgressIndicator(
                color: Colors.blueGrey,
                backgroundColor: Colors.white,
                strokeWidth: 5.0,
              ),
            ),
          );
        });
  }
}
