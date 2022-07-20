import 'package:flutter/material.dart';
import 'package:self_work/All_About_Api/Api_integration.dart';
import 'package:self_work/All_About_Api/futurebuilderinApi.dart';
import 'package:self_work/Stream_BuilderPractice.dart';
import 'package:self_work/webview(13-07-2022).dart';

class Allwork extends StatefulWidget {
  const Allwork({Key? key}) : super(key: key);

  @override
  State<Allwork> createState() => _AllworkState();
}

class _AllworkState extends State<Allwork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Projects'),
        ),
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Api_integration()));
                },
                child: Text('Api Integration'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Webviewpractice()));
                },
                child: Text('Webview(13-07-2022)'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Stream()));
                },
                child: Text('Stream Builder(14-07-2022)'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FuturebuiledrinApi()));
                },
                child: Text('Api Integration with Future Builder'),
              ),
            ),
          ],
        ));
  }
}
