import 'package:flutter/material.dart';

class PracticeWidget extends StatefulWidget {
  const PracticeWidget({super.key});

  @override
  State<PracticeWidget> createState() => _PracticeWidgetState();
}

class _PracticeWidgetState extends State<PracticeWidget> {
  bool isvisibility = true;
  RangeValues values = const RangeValues(0.0, 0.5);
  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(values.start.toString(), values.end.toString());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: false,
            floating: true,
            title: Text('Sliver App Bar'),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: isvisibility,
                    child: Image.asset('assets/abc.gif'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isvisibility = !isvisibility;
                        });
                      },
                      child:
                          Center(child: Text(isvisibility ? 'Remove' : 'Add'))),
                  const Text(
                    'Range Slider ------',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  RangeSlider(
                      values: values,
                      labels: labels,
                      divisions: 8,
                      onChanged: (newvalue) {
                        values = newvalue;
                        setState(() {});
                        Text("$values");
                      }),
                      
                ],
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
