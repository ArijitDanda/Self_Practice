import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:self_work/All_Model.dart';

class Todosdata extends StatefulWidget {
  const Todosdata({Key? key}) : super(key: key);

  @override
  State<Todosdata> createState() => _TodosdataState();
}

class _TodosdataState extends State<Todosdata> {
  List<Todosmodel> tlist = [];
  late Future<List<Todosmodel>> _future;
  Future<List<Todosmodel>> tododata() async {
    String url = 'https://jsonplaceholder.typicode.com/todos';
    var result = await get(Uri.parse(url));
    if (result.statusCode == 200) {
      var data = jsonDecode(result.body);
      for (int i = 0; i < data.length; i++) {
        tlist.add(Todosmodel.fromjson(data[i]));
      }
    }
    return [];
  }

  @override
  void initState() {
    super.initState();
    _future = tododata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos Model Data'),
      ),
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: tlist.length,
                  itemBuilder: (context, inde) {
                    return Container(
                      color: Colors.yellow,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(tlist[inde].id.toString()),
                          Text(tlist[inde].title),
                          Text(tlist[inde].complete.toString())
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text('Error'));
            } else {
              return Center(
                  child: CupertinoActivityIndicator(
                radius: 30,
                color: Colors.black,
              ));
            }
          }),
    );
  }
}
