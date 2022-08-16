import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:self_work/Api_practice_11-08-2022/homepage.dart';
import 'package:self_work/Api_practice_11-08-2022/todosmoddeldata.dart';

class Logpage extends StatefulWidget {
  const Logpage({Key? key}) : super(key: key);

  @override
  State<Logpage> createState() => _LogpageState();
}

class _LogpageState extends State<Logpage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController usernamecntrl = TextEditingController();
  TextEditingController passcntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formkey,
          child: Stack(
            children: [
              Image.asset(
                'assets/login.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                margin: const EdgeInsets.all(80.0),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 300),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Username Properly';
                          }
                        },
                        controller: usernamecntrl,
                        decoration: InputDecoration(
                            hintText: 'Enter The User Name or Email',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter The Password Properly';
                          }
                        },
                        controller: passcntrl,
                        decoration: InputDecoration(
                            hintText: 'Enter The Password',
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Sign in',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_formkey.currentState!.validate()) {
                                  loginapi(usernamecntrl.text, passcntrl.text);
                                  Get.to(() => const Todosdata());
                                }
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.blueGrey,
                                radius: 22,
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: ElevatedButton.icon(
                      //           style: ButtonStyle(
                      //             padding: MaterialStateProperty.all(
                      //                 const EdgeInsets.all(10.0)),
                      //           ),
                      //           onPressed: () {
                      //             if (_formkey.currentState!.validate()) {
                      //               loginapi(
                      //                   usernamecntrl.text, passcntrl.text);
                      //             }
                      //           },
                      //           icon: const Icon(Icons.login),
                      //           label: const Text(
                      //             'Sign Up',
                      //             style: TextStyle(
                      //                 fontSize: 17,
                      //                 fontWeight: FontWeight.bold),
                      //           )),
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future loginapi(
    String emil,
    pass,
  ) async {
    String url = 'https://demo50.gowebbi.us/api/RegisterApi/Login';
    Map<String, dynamic> param = {
      "Email": usernamecntrl.text,
      "Password": passcntrl.text,
    };
    var myres = await post(Uri.parse(url), body: param);
    var data = jsonDecode(myres.body);
    if (data['status'] == 'success') {
      print(data['msg']);
    } else {
      print(data['msg']);
    }
  }
}
