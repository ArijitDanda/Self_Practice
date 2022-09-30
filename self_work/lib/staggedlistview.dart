import 'package:flutter/material.dart';

class StaggedListView extends StatefulWidget {
  const StaggedListView({super.key});

  @override
  State<StaggedListView> createState() => _StaggedListViewState();
}

class _StaggedListViewState extends State<StaggedListView> {
  bool isselect = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: isselect ? Colors.transparent : Colors.white,
        appBar: AppBar(
          title: const Text('StaggedListView'),
        )
        // // ),
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     // for (int i = 0; i < 50; i++)
        //     ChoiceChip(
        //       elevation: 0,
        //       selectedColor: isselect ? Colors.black : Colors.white,
        //       backgroundColor: isselect ? Colors.black : Colors.white,
        //       label: Icon(
        //         Icons.lightbulb,
        //         size: 400,
        //         color: isselect ? Colors.black : Colors.yellow,
        //       ),
        //       selected: isselect,
        //       onSelected: (value) {
        //         isselect = value;
        //         setState(() {});
        //       },
        //     ),
        //   ],
        // ),
        );
  }
}
