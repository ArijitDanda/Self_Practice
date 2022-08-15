import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_work/webview(13-07-2022).dart';

class Signin extends StatefulWidget {
  final String email, password;
  const Signin({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('SIGN IN'),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != widget.email) {
                    return 'Enter Email';
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != widget.password) {
                    return 'Enter Password';
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    prefixIcon: const Icon(Icons.password),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Text('Access Permit');
                      Get.to(Webviewpractice());
                    }
                  },
                  child: Text('Get'))
            ],
          ),
        ),
      ),
    );
  }
}
