import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Stream extends StatefulWidget {
  const Stream({Key? key}) : super(key: key);

  @override
  State<Stream> createState() => _StreamState();
}

class _StreamState extends State<Stream> {
  int count = 0;
  StreamController<int> _Scontroll = StreamController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Stream Builder practice'),
        ),
        body: StreamBuilder<int>(
            stream: _Scontroll.stream,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: Text(
                  'Press $count ',
                  style: const TextStyle(fontSize: 30),
                ));
              } else {
                return const Center(
                  child: Text(
                    'No Data',
                    style: TextStyle(fontSize: 30),
                  ),
                );
              }
            })),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              child: const Center(
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              onPressed: () {
                count++;
                _Scontroll.sink.add(count);
              },
            ),
            FloatingActionButton(
              child: const Center(
                child: Text(
                  '-',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              onPressed: () {
                count--;
                _Scontroll.sink.add(count = max(count - 0, 0));
              },
            ),
          ],
        ));
  }
}
