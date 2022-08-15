import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:self_work/signin.dart';

class Formpractice extends StatefulWidget {
  const Formpractice({Key? key}) : super(key: key);

  @override
  State<Formpractice> createState() => _FormpracticeState();
}

class _FormpracticeState extends State<Formpractice> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  final ImagePicker _pick = ImagePicker();
  String? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: result == null
                          ? Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey),
                              child: Icon(Icons.camera_alt_rounded))
                          : SizedBox(
                              height: 150,
                              width: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.file(
                                  File(result!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            imagepick(ImageSource.camera);
                                          },
                                          icon: Icon(Icons.camera_alt)),
                                      IconButton(
                                          onPressed: () {
                                            imagepick(ImageSource.gallery);
                                          },
                                          icon: Icon(Icons.browse_gallery))
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text('Close'))
                                  ],
                                );
                              });
                        },
                        child: Text('Select Image')),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter The Password like given above';
                      }
                    },
                    controller: name,
                    decoration: InputDecoration(
                        hintText: 'Enter Your Name',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter The Password like given above';
                      }
                    },
                    controller: phone,
                    decoration: InputDecoration(
                        hintText: 'Enter Your Phone Number',
                        prefixIcon: const Icon(Icons.call),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter The Password like given above';
                      }
                    },
                    controller: email,
                    decoration: InputDecoration(
                        hintText: 'Enter Your Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter The Password like given above';
                      }
                    },
                    controller: password,
                    decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        prefixIcon: const Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value != password.text) {
                        return 'Enter The Password like given above';
                      }
                    },
                    controller: cpassword,
                    decoration: InputDecoration(
                        hintText: 'Enter Your Confirm Password',
                        prefixIcon: const Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          print(name.text);
                          Get.to(Signin(
                              email: email.text, password: password.text));
                        }
                      },
                      child: Text('Save Data'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void imagepick(ImageSource source) async {
    var image = await _pick.pickImage(source: source);
    result = image!.path;
    setState(() {});
  }
}
