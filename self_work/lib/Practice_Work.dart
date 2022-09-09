import 'package:flutter/material.dart';

class PracticeWork extends StatefulWidget {
  const PracticeWork({super.key});

  @override
  State<PracticeWork> createState() => _PracticeWorkState();
}

class _PracticeWorkState extends State<PracticeWork> {
  TextEditingController textcontroller = TextEditingController();
  bool ischeck = true;
  bool change = true;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: const CircleBorder(),
                title: const Text('Cash'),
                value: ischeck,
                onChanged: (value) {
                  ischeck = value!;
                  setState(() {});
                }),
            CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: const CircleBorder(),
                title: const Text('Epay'),
                value: ischeck,
                onChanged: (value1) {
                  ischeck = value1!;
                  setState(() {});
                }),
            ActionChip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.grey.shade800,
                    child: Icon(Icons.add)),
                label: const Text('Add Memeber'),
                onPressed: () {
                  print(
                      'If you stand for nothing, Burr, what’ll you fall for?');
                }),
            /*  AspectRatio(
              This examples shows how AspectRatio sets width when its parent's width constraint is infinite. Since its parent's allowed height is a fixed value, the actual width is determined via the given AspectRatio.
      Since the height is fixed at 100.0 in this example and the aspect ratio is set to 16 / 9, the width should then be 100.0 / 9 * 16.
                aspectRatio: 2.0, */
            AspectRatio(
                aspectRatio: 2.2,
                child: Image.network(
                    'https://images.unsplash.com/photo-1501854140801-50d01698950b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')),
            Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please Enter the Coupon';
                    }
                  }),
                  controller: textcontroller,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              print(textcontroller.text);
                              change = !change;
                              setState(() {});
                            }
                            if (change == true) {
                              textcontroller.clear();
                            }
                            // print(textcontroller.text);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Text(
                              change ? 'Apply' : 'Remove',
                              textAlign: TextAlign.center,
                              style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}
