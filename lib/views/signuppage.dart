import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:srashti/component/api.dart';
import 'package:srashti/views/welcomepage.dart';
import 'package:srashti/widgets/coustom_scaffold.dart';
import 'package:http/http.dart' as http;
import 'package:srashti/widgets/customsnackbar.dart';

class Signuppage extends StatefulWidget
{
  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final signupkey = GlobalKey<FormState>();

  var remember = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  Future<void> signin()async {
try{
  if (signupkey.currentState!.validate()) {

    final url = Uri.parse('${Apiurl}signup');
    var res = await http.post(url, body: {
      "name": nameController.text,
      "email": emailController.text,
      "pass": passController.text
    });
    // print(res);
    // return;

    var response = jsonDecode(res.body);
    if(response['status'] == '200'){
      nameController.text ="";
      passController.text ="";
      emailController.text ="";
      CustomSnackbar.snackbar('Success', 'Details added Successfully',Icons.check_circle);
      Get.offAll(Welcomepage());
    }else{
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text('error')));
      CustomSnackbar.snackbar('Error', 'Something went wrong',Icons.error);
    }
  }
}
    catch(e){
      CustomSnackbar.snackbar('Error', e.toString(),Icons.error);
    }
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'please enter an email';
    }
    RegExp emailRegexp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegexp.hasMatch(value)) {
      return 'enter valid email';
    }
    return null;
  }
  String? _validatePass(value) {
    if (value!.isEmpty) {
      return 'please enter a password';
    }
    return null;
  }
  String? _validateName(value) {
    if (value!.isEmpty) {
      return 'please enter a Name';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CoustomScaffold(
        title: Text(
          'Back',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: SizedBox(
                  height: 10,
                )),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0))),
                child: SingleChildScrollView(
                  child: Form(
                    key: signupkey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'Signup',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: nameController,
                            validator: _validateName,
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                                label: Text('Enter Name '),
                                hintText: 'Enter Name',
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                      width: 3,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 3,
                                    ))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: _validateEmail,
                            controller: emailController,
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                                label: Text('Enter Email '),
                                hintText: 'Enter Email',
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                      width: 3,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 3,
                                    ))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            controller: passController,
                            validator: _validatePass,
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                                label: Text('Enter Password '),
                                hintText: 'Enter Password',
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                      width: 3,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 3,
                                    ))),
                          ),
                          SizedBox(
                            height: 25,
                          ),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                signin();
                              },
                              child: Text(
                                'Sigup',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Sign Up With',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Bootstrap.facebook, size: 50,color: Colors.blue,),
                              Icon(Bootstrap.google, size: 50 ,color: Colors.red,),
                              Icon(Bootstrap.github, size: 50),
                              Icon(Bootstrap.apple, size: 50),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ));
  }
}