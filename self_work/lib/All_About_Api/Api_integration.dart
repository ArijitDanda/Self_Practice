// ignore_for_file: file_names, camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:self_work/All_Model.dart';

// ignore: camel_case_types
class Api_integration extends StatefulWidget {
  const Api_integration({Key? key}) : super(key: key);

  @override
  State<Api_integration> createState() => _Api_integrationState();
}

class _Api_integrationState extends State<Api_integration> {
  List<Usermodel> ulist = [];
  @override
  void initState() {
    getapi();
    super.initState();
  }

  getapi() async {
    String url = 'https://jsonplaceholder.typicode.com/users';
    var result = await get(Uri.parse(url));
    if (result.statusCode == 200) {
      var response = jsonDecode(result.body);

      for (int i = 0; i < response.length; i++) {
        ulist.add(Usermodel.fromjson(response[i]));
        print(response[i]['name']);
      }
      setState(() {});
    } else {
      print('Error');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Integration'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < ulist.length; i++) 
            Text(ulist[i].com.bs),
          ],
        ),
      ),
    );
  }
}
