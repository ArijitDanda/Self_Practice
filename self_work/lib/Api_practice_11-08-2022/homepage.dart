import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:self_work/Api_practice_11-08-2022/Usermodel.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Practicemodel> plist = [];
  late Future<List<Practicemodel>> _future;
  @override
  void initState() {
    super.initState();
   _future= getdata();
  }

  Future<List<Practicemodel>> getdata() async {
    String Url = 'https://jsonplaceholder.typicode.com/users';
    var myres = await get(Uri.parse(Url));
    if (myres.statusCode == 200) {
      var result = jsonDecode(myres.body);
      for (int i = 0; i < result.length; i++) {
        plist.add(Practicemodel.fromjson(result[i]));
        print(result[i]['name']);
      }
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: FutureBuilder<List<Practicemodel>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: plist.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.amber,
                      margin: EdgeInsets.all(12),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(plist[index].name),
                          Text(plist[index].com.name),
                          Text(plist[index].add.zipcode),
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text('Error'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
