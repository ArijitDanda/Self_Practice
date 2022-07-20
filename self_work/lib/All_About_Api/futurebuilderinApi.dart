import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:self_work/All_Model.dart';

class FuturebuiledrinApi extends StatefulWidget {
  const FuturebuiledrinApi({Key? key}) : super(key: key);

  @override
  State<FuturebuiledrinApi> createState() => _FuturebuiledrinApiState();
}

class _FuturebuiledrinApiState extends State<FuturebuiledrinApi> {
  List<Todosmodel> tlist = [];
  @override
  void initState() {
    super.initState();
    // getpost();
  }

  Future<List<Todosmodel>> getpost() async {
    String Url = 'https://jsonplaceholder.typicode.com/todos';
    var result = await get(Uri.parse(Url));
    if (result.statusCode == 200) {
      var data = jsonDecode(result.body);
      for (int i = 0; i < data.length; i++) {
        tlist.add(Todosmodel.fromjson(data[i]));
      }
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Api with Furture Builder'),
        ),
        body: FutureBuilder<List<Todosmodel>>(
            future: getpost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                tlist = snapshot.data!;
                return ListView.builder(
                    itemCount: tlist.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.amber,
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('User Id: ${tlist[index].uid}'),
                            Text(' Id: ${tlist[index].id}'),
                            Text('Title: ${tlist[index].title}'),
                            Text('Status: ${tlist[index].complete}'),
                          ],
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text('Error'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
